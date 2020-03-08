using CasaDoCodigo.Areas.Carrinho.Models;
using Newtonsoft.Json;
using StackExchange.Redis;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace CasaDoCodigo.Console
{
    class Program
    {
        private const string clienteId = "id_do_cliente";
        private const int CARRINHO_DB_INDEX = 0;

        static async Task Main(string[] args)
        {
            IConnectionMultiplexer _redis = ConnectionMultiplexer.Connect("localhost");
            IDatabase _database = _redis.GetDatabase(CARRINHO_DB_INDEX);

            string jsonCarrinho;
            Carrinho novoCarrinho = null;
            ItemCarrinho novoItemCarrinho = new ItemCarrinho(clienteId, "001", "ASP.NET Core com Múltiplas Bases de Dados", 50.0m, 1);
            var data = await _database.StringGetAsync("id_do_cliente");
            if (data.IsNullOrEmpty)
            {
                novoCarrinho = new Carrinho(clienteId);
                novoCarrinho.Itens.Add(novoItemCarrinho);
                jsonCarrinho = JsonConvert.SerializeObject(novoCarrinho);
                await _database.StringSetAsync("id_do_cliente", jsonCarrinho);
            }

            ImprimirCarrinho(novoCarrinho);

            var json = await _database.StringGetAsync("id_do_cliente");
            var carrinho = JsonConvert.DeserializeObject<Carrinho>(json);

            var itemCarrinho = 
                carrinho.Itens.Where(i => i.ProdutoCodigo == "001").Single();

            itemCarrinho.Quantidade = 7;
            jsonCarrinho = JsonConvert.SerializeObject(carrinho);
            await _database.StringSetAsync("id_do_cliente", jsonCarrinho);

            ImprimirCarrinho(carrinho);
            System.Console.WriteLine("Tecle ENTER para sair...");
            System.Console.ReadLine();
        }

        private static void ImprimirCarrinho(Carrinho carrinho)
        {
            System.Console.WriteLine();
            System.Console.WriteLine("Carrinho:");
            System.Console.WriteLine("=========");
            
            System.Console.WriteLine("Id do cliente: {0}", carrinho.ClienteId);
            System.Console.WriteLine("Id do cliente: {0:C}", carrinho.Total);

            System.Console.WriteLine("Produtos:");
            System.Console.WriteLine("=========");
            foreach (var item in carrinho.Itens)
            {
                System.Console.WriteLine("Codigo: {0}, Nome: {1}, Preço Unitário: {2:C}, Quantidade: {3}, Subtotal: {4:C}"
                    , item.ProdutoCodigo, item.ProdutoNome, item.PrecoUnitario, item.Quantidade, item.Subtotal);
            }
            System.Console.WriteLine();
        }


        //public RedisCarrinhoRepository(ILogger<RedisCarrinhoRepository> logger, IConnectionMultiplexer redis)
        //{
        //    _redis = redis;
        //    _database = redis.GetDatabase(CARRINHO_DB_INDEX);
        //}

        //public async Task<bool> DeleteCarrinhoAsync(string id)
        //{
        //    return await _database.KeyDeleteAsync(id);
        //}

        //public async Task<Carrinho> GetCarrinhoAsync(string clienteId)
        //{
        //    if (string.IsNullOrWhiteSpace(clienteId))
        //        throw new ArgumentException();

        //    var data = await _database.StringGetAsync(clienteId);
        //    if (data.IsNullOrEmpty)
        //    {
        //        return await UpdateCarrinhoAsync(new Carrinho(clienteId));
        //    }
        //    return JsonConvert.DeserializeObject<Carrinho>(data);
        //}

        //public IEnumerable<string> GetUsuarios()
        //{
        //    var server = GetServer();
        //    return server.Keys()?.Select(k => k.ToString());
        //}

        //public async Task<Carrinho> AddItemCarrinhoAsync(string clienteId, ItemCarrinho item)
        //{
        //    if (item == null)
        //        throw new ArgumentNullException();

        //    if (string.IsNullOrWhiteSpace(item.ProdutoCodigo))
        //        throw new ArgumentException();

        //    if (item.Quantidade <= 0)
        //        throw new ArgumentOutOfRangeException();

        //    var carrinho = await GetCarrinhoAsync(clienteId);
        //    ItemCarrinho itemDB = carrinho.Itens.Where(i => i.ProdutoCodigo == item.ProdutoCodigo).SingleOrDefault();
        //    if (itemDB == null)
        //    {
        //        itemDB = new ItemCarrinho(item.Id, item.ProdutoCodigo, item.ProdutoNome, item.PrecoUnitario, item.Quantidade);
        //        carrinho.Itens.Add(item);
        //    }
        //    return await UpdateCarrinhoAsync(carrinho);
        //}

        //public async Task<UpdateQuantidadeOutput> UpdateItemCarrinhoAsync(string customerId, UpdateQuantidadeInput item)
        //{
        //    if (item == null)
        //        throw new ArgumentNullException();

        //    if (string.IsNullOrWhiteSpace(item.Id))
        //        throw new ArgumentException();

        //    if (item.Quantidade < 0)
        //        throw new ArgumentOutOfRangeException();

        //    var basket = await GetCarrinhoAsync(customerId);
        //    ItemCarrinho itemDB = basket.Itens.Where(i => i.ProdutoCodigo == item.Id).SingleOrDefault();
        //    itemDB.Quantidade = item.Quantidade;
        //    if (item.Quantidade == 0)
        //    {
        //        basket.Itens.Remove(itemDB);
        //    }
        //    Carrinho customerBasket = await UpdateCarrinhoAsync(basket);
        //    return new UpdateQuantidadeOutput(itemDB, customerBasket);
        //}

        //private IServer GetServer()
        //{
        //    var endpoints = _redis.GetEndPoints();
        //    return _redis.GetServer(endpoints.First());
        //}

    }
}
