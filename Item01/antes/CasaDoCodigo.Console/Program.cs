using CasaDoCodigo.Areas.Catalogo.Data;
using CasaDoCodigo.Areas.Catalogo.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace CasaDoCodigo.Console
{
    class Program
    {
        static void Main(string[] args)
        {
        }

        private static void ImprimirResultado(System.Collections.Generic.List<Produto> resultado)
        {
            System.Console.WriteLine();
            System.Console.WriteLine("Resultado:");
            System.Console.WriteLine("==========");
            foreach (var produto in resultado)
            {
                System.Console.WriteLine("ID: {0}, Codigo: {1}, CategoriaId: {2}, Nome: {3}", produto.Id, produto.Codigo, produto.CategoriaId, produto.Nome);
            }
        }

        private static void ListarProdutos(CatalogoDbContext contexto)
        {
            System.Console.WriteLine();
            System.Console.WriteLine("Produtos:");
            System.Console.WriteLine("=========");
            foreach (var produto in contexto.Set<Produto>())
            {
                System.Console.WriteLine("ID: {0}, Codigo: {1}, CategoriaId: {2}, Nome: {3}", produto.Id, produto.Codigo, produto.CategoriaId, produto.Nome);
            }
        }

        private static void ListarCategorias(CatalogoDbContext contexto)
        {
            System.Console.WriteLine("Categorias:");
            System.Console.WriteLine("===========");
            foreach (var categoria in contexto.Set<Categoria>())
            {
                System.Console.WriteLine("ID: {0}, Nome: {1}", categoria.Id, categoria.Nome);
            }
        }
    }
}
