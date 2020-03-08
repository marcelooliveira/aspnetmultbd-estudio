using CasaDoCodigo.Areas.Carrinho.Models;
using CasaDoCodigo.Areas.Catalogo.Data;
using CasaDoCodigo.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CasaDoCodigo.Areas.Carrinho.Data
{
    public class SQLCarrinhoRepository : ICarrinhoRepository
    {
        private readonly CarrinhoDbContext contexto;

        public SQLCarrinhoRepository(CarrinhoDbContext contexto)
        {
            this.contexto = contexto;
        }

        public async Task<bool> DeleteCarrinhoAsync(string id)
        {
            var carrinho =
                contexto.Set<Models.Carrinho>()
                .Where(c => c.ClienteId == id)
                .SingleOrDefault();

            if (carrinho == null)
                throw new ApplicationException(string.Format("Carrinho não encontrado: {0}", id));

            contexto.Set<Models.Carrinho>()
                .Remove(carrinho);
            await contexto.SaveChangesAsync();
            return true;
        }

        public async Task<Models.Carrinho> GetCarrinhoAsync(string clienteId)
        {
            if (string.IsNullOrWhiteSpace(clienteId))
                throw new ArgumentException();

            var carrinho =
            contexto.Set<Models.Carrinho>()
                .Include(p => p.Itens)
                .Where(c => c.ClienteId == clienteId)
                .SingleOrDefault();

            if (carrinho == null)
            {
                carrinho = new Models.Carrinho(clienteId);
                contexto.Set<Models.Carrinho>()
                    .Add(carrinho);
                await contexto.SaveChangesAsync();
            }

            return carrinho;
        }

        public IEnumerable<string> GetUsuarios()
        {
            return new List<string>();
        }

        public async Task<Models.Carrinho> AddItemCarrinhoAsync(string clienteId, ItemCarrinho item)
        {
            if (item == null)
                throw new ArgumentNullException();

            if (string.IsNullOrWhiteSpace(item.ProdutoCodigo))
                throw new ArgumentException();

            if (item.Quantidade <= 0)
                throw new ArgumentOutOfRangeException();

            var carrinho = await GetCarrinhoAsync(clienteId);
            ItemCarrinho itemDB = carrinho.Itens.Where(i => i.ProdutoCodigo == item.ProdutoCodigo).SingleOrDefault();
            if (itemDB == null)
            {
                itemDB = new ItemCarrinho(carrinho, item.ProdutoCodigo, item.ProdutoNome, item.PrecoUnitario, item.Quantidade);
                carrinho.Itens.Add(item);
                await contexto.SaveChangesAsync();
            }
            return carrinho;
        }

        public async Task<UpdateQuantidadeOutput> UpdateItemCarrinhoAsync(string customerId, UpdateQuantidadeInput item)
        {
            if (item == null)
                throw new ArgumentNullException();

            if (string.IsNullOrWhiteSpace(item.Id))
                throw new ArgumentException();

            if (item.Quantidade < 0)
                throw new ArgumentOutOfRangeException();

            var carrinho = await GetCarrinhoAsync(customerId);
            ItemCarrinho itemDB = carrinho.Itens.Where(i => i.ProdutoCodigo == item.Id).SingleOrDefault();
            itemDB.Quantidade = item.Quantidade;
            if (item.Quantidade == 0)
            {
                carrinho.Itens.Remove(itemDB);
                await contexto.SaveChangesAsync();
            }
            return new UpdateQuantidadeOutput(itemDB, carrinho);
        }
    }

}
