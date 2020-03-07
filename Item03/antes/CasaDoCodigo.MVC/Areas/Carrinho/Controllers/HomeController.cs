﻿using System.Collections.Generic;
using System.Threading.Tasks;
using CasaDoCodigo.Areas.Identity.Data;
using CasaDoCodigo.Models;
using CasaDoCodigo.Models.ViewModels;
using CasaDoCodigo.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CasaDoCodigo.Areas.Carrinho.Controllers
{
    [Area("Carrinho")]
    public class HomeController : Controller
    {
        private readonly IPedidoRepository pedidoRepository;
        private readonly UserManager<AppIdentityUser> userManager;

        public HomeController(IPedidoRepository pedidoRepository,
            UserManager<AppIdentityUser> userManager)
        {
            this.pedidoRepository = pedidoRepository;
            this.userManager = userManager;
        }

        [Authorize]
        public async Task<IActionResult> Index(string codigo)
        {
            if (!string.IsNullOrEmpty(codigo))
            {
                await pedidoRepository.AddItemAsync(codigo);
            }

            var pedido = await pedidoRepository.GetPedidoAsync();
            List<ItemPedido> itens = pedido.Itens;
            CarrinhoViewModel carrinhoViewModel = new CarrinhoViewModel(itens);
            return base.View(carrinhoViewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public async Task<UpdateQuantidadeResponse> UpdateQuantidade([FromBody]ItemPedido itemPedido)
        {
            return await pedidoRepository.UpdateQuantidadeAsync(itemPedido);
        }
    }
}
