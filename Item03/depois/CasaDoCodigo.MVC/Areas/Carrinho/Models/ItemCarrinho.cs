﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace CasaDoCodigo.Areas.Carrinho.Models
{
    public class ItemCarrinho : IValidatableObject
    {
        public ItemCarrinho() 
        {
             
        }

        public ItemCarrinho(string id, string produtoCodigo, string produtoNome, decimal precoUnitario, int quantidade)
        {
            Id = id;
            ProdutoCodigo = produtoCodigo;
            ProdutoNome = produtoNome;
            PrecoUnitario = precoUnitario;
            Quantidade = quantidade;
        }

        public string Id { get; set; }
        [Required]
        public string ProdutoCodigo { get; set; }
        [Required]
        public string ProdutoNome { get; set; }
        [Required]
        public int Quantidade { get; set; }
        [Required]
        public decimal PrecoUnitario { get; set; }
        public decimal Subtotal => Quantidade * PrecoUnitario;
        public string ImageURL { get { return $"/images/catalog/large_{ProdutoCodigo}.jpg"; } }
        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            var results = new List<ValidationResult>();

            if (Quantidade < 1)
            {
                results.Add(new ValidationResult("Quantidade inválida", new[] { "Quantidade" }));
            }

            return results;
        }
    }
}