using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace CasaDoCodigo.Areas.Carrinho.Data.Migrations
{
    public partial class Carrinho : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Carrinho",
                columns: table => new
                {
                    ClienteId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Carrinho", x => x.ClienteId);
                });

            migrationBuilder.CreateTable(
                name: "ItemCarrinho",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    CarrinhoClienteId = table.Column<string>(nullable: false),
                    ProdutoCodigo = table.Column<string>(nullable: false),
                    ProdutoNome = table.Column<string>(nullable: false),
                    Quantidade = table.Column<int>(nullable: false),
                    PrecoUnitario = table.Column<decimal>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ItemCarrinho", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ItemCarrinho_Carrinho_CarrinhoClienteId",
                        column: x => x.CarrinhoClienteId,
                        principalTable: "Carrinho",
                        principalColumn: "ClienteId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ItemCarrinho_CarrinhoClienteId",
                table: "ItemCarrinho",
                column: "CarrinhoClienteId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ItemCarrinho");

            migrationBuilder.DropTable(
                name: "Carrinho");
        }
    }
}
