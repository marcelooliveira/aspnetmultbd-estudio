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
        static async Task Main(string[] args)
        {
            IConnectionMultiplexer _redis = await ConnectionMultiplexer.ConnectAsync("localhost");
            IDatabase _database = _redis.GetDatabase();

            Carrinho carrinho = null;
            string json;
            if (!await _database.KeyExistsAsync(key: "id_do_cliente"))
            {
                carrinho = new Carrinho("id_do_cliente");
                var novoItemCarrinho = new ItemCarrinho("id_do_cliente", "001", "ASP.NET Core com Múltiplas Bases de Dados", 50.0m, 1);
                carrinho.Itens.Add(novoItemCarrinho);
                json = JsonConvert.SerializeObject(carrinho);
                await _database.StringSetAsync(key: "id_do_cliente", json);
            }

            json = await _database.StringGetAsync(key: "id_do_cliente");
            carrinho = JsonConvert.DeserializeObject<Carrinho>(json);

            ImprimirCarrinho(carrinho);

            var itemCarrinho = 
                carrinho.Itens.Where(i => i.ProdutoCodigo == "001").Single();

            itemCarrinho.Quantidade = 7;
            json = JsonConvert.SerializeObject(carrinho);
            await _database.StringSetAsync(key: "id_do_cliente", json);

            ImprimirCarrinho(carrinho);

            await _database.KeyDeleteAsync(key: "id_do_cliente");

            System.Console.WriteLine("Tecle ENTER para sair...");
            System.Console.ReadLine();
        }

        private static void ImprimirCarrinho(Carrinho carrinho)
        {
            System.Console.WriteLine();
            System.Console.WriteLine("Carrinho:");
            System.Console.WriteLine("=========");
            
            System.Console.WriteLine("Id do cliente: {0}", carrinho.ClienteId);
            System.Console.WriteLine("Total: {0:C}", carrinho.Total);

            System.Console.WriteLine("Produtos:");
            System.Console.WriteLine("=========");
            foreach (var item in carrinho.Itens)
            {
                System.Console.WriteLine("Codigo: {0}, Nome: {1}, Preço Unitário: {2:C}, Quantidade: {3}, Subtotal: {4:C}"
                    , item.ProdutoCodigo, item.ProdutoNome, item.PrecoUnitario, item.Quantidade, item.Subtotal);
            }
            System.Console.WriteLine();
        }
    }
}
