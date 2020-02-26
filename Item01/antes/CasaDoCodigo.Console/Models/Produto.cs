using System.ComponentModel.DataAnnotations;

namespace CasaDoCodigo.Areas.Catalogo.Models
{
    public class Produto : BaseModel
    {
        public Produto()
        {

        }

        public int? CategoriaId { get; set; }

        [Required]
        public Categoria Categoria { get; set; }
        [Required]
        public string Codigo { get; set; }
        [Required]
        public string Nome { get; set; }
        [Required]
        public decimal Preco { get; set; }

        public Produto(int id, string codigo, string nome, decimal preco, Categoria categoria) 
            : this(codigo, nome, preco, categoria)
        {
            Id = id;
        }

        public Produto(string codigo, string nome, decimal preco, Categoria categoria)
        {
            this.Codigo = codigo;
            this.Nome = nome;
            this.Preco = preco;
            this.Categoria = categoria;
        }
    }
}
