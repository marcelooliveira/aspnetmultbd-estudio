using Microsoft.EntityFrameworkCore;

namespace CasaDoCodigo.Areas.Catalogo.Data
{
    public class CarrinhoDbContext : DbContext
    {
        public CarrinhoDbContext(DbContextOptions<CarrinhoDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Carrinho.Models.Carrinho>().HasKey(t => t.ClienteId);
            modelBuilder.Entity<Carrinho.Models.Carrinho>().HasMany(t => t.Itens)
                .WithOne(t => t.Carrinho);
            modelBuilder.Entity<Carrinho.Models.ItemCarrinho>().HasKey(t => t.Id);
            modelBuilder.Entity<Carrinho.Models.ItemCarrinho>().HasOne(t => t.Carrinho);
        }
    }
}
