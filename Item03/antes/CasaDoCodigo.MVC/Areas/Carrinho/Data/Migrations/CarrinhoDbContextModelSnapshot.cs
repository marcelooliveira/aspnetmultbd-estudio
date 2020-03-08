﻿// <auto-generated />
using CasaDoCodigo.Areas.Catalogo.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace CasaDoCodigo.Areas.Carrinho.Data.Migrations
{
    [DbContext(typeof(CarrinhoDbContext))]
    partial class CarrinhoDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.2.4-servicing-10062");

            modelBuilder.Entity("CasaDoCodigo.Models.Carrinho", b =>
                {
                    b.Property<string>("ClienteId")
                        .ValueGeneratedOnAdd();

                    b.HasKey("ClienteId");

                    b.ToTable("Carrinho");
                });

            modelBuilder.Entity("CasaDoCodigo.Models.ItemCarrinho", b =>
                {
                    b.Property<string>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("CarrinhoClienteId")
                        .IsRequired();

                    b.Property<decimal>("PrecoUnitario");

                    b.Property<string>("ProdutoCodigo")
                        .IsRequired();

                    b.Property<string>("ProdutoNome")
                        .IsRequired();

                    b.Property<int>("Quantidade");

                    b.HasKey("Id");

                    b.HasIndex("CarrinhoClienteId");

                    b.ToTable("ItemCarrinho");
                });

            modelBuilder.Entity("CasaDoCodigo.Models.ItemCarrinho", b =>
                {
                    b.HasOne("CasaDoCodigo.Models.Carrinho", "Carrinho")
                        .WithMany("Itens")
                        .HasForeignKey("CarrinhoClienteId")
                        .OnDelete(DeleteBehavior.Cascade);
                });
#pragma warning restore 612, 618
        }
    }
}
