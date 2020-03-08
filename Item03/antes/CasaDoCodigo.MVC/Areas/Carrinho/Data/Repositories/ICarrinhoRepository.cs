using CasaDoCodigo.Areas.Carrinho.Models;
using CasaDoCodigo.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CasaDoCodigo.Areas.Carrinho.Data
{
    public interface ICarrinhoRepository
    {
        Task<Models.Carrinho> GetCarrinhoAsync(string clienteId);
        IEnumerable<string> GetUsuarios();
        Task<Models.Carrinho> AddItemCarrinhoAsync(string clienteId, ItemCarrinho item);
        Task<UpdateQuantidadeOutput> UpdateItemCarrinhoAsync(string clienteId, UpdateQuantidadeInput item);
        Task<bool> DeleteCarrinhoAsync(string id);
    }

}
