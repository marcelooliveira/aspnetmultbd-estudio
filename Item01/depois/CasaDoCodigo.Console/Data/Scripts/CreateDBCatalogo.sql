USE [master]
GO
/****** Object:  Database [CasaDoCodigo.Catalogo]    Script Date: 25/02/2020 21:04:08 ******/
CREATE DATABASE [CasaDoCodigo.Catalogo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CasaDoCodigo.Catalogo', FILENAME = N'C:\Users\marce\CasaDoCodigo.Catalogo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CasaDoCodigo.Catalogo_log', FILENAME = N'C:\Users\marce\CasaDoCodigo.Catalogo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CasaDoCodigo.Catalogo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET ARITHABORT OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET  MULTI_USER 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET QUERY_STORE = OFF
GO
USE [CasaDoCodigo.Catalogo]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [CasaDoCodigo.Catalogo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 25/02/2020 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 25/02/2020 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoriaId] [int] NOT NULL,
	[Codigo] [nvarchar](max) NOT NULL,
	[Nome] [nvarchar](max) NOT NULL,
	[Preco] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 25/02/2020 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (1, N'Livros de Programação / Lógica')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (2, N'Livros de Programação / Java')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (3, N'Livros de Programação / .NET')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (4, N'Livros de Programação / PHP')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (5, N'Livros de Programação / Games')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (6, N'Livros de Programação / Funcional')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (7, N'Livros de Programação / Outros')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (8, N'Livros de Mobile / IOS')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (9, N'Livros de Mobile / Android')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (10, N'Livros de Mobile / Multiplataforma')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (11, N'Livros de Mobile / Outros')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (12, N'Livros de Front-end / HTML e CSS')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (13, N'Livros de Front-end / JavaScript')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (14, N'Livros de Front-end / Outros')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (15, N'Livros de Infraestrutura / Redes')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (16, N'Livros de Infraestrutura / Dados')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (17, N'Livros de Infraestrutura / Outros')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (18, N'Livros de Business / Startups')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (19, N'Livros de Business / Marketing Digital')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (20, N'Livros de Business / Gestão')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (21, N'Livros de Business / Agile')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (22, N'Livros de Business / Outros')
INSERT [dbo].[Categoria] ([Id], [Nome]) VALUES (23, N'Livros de Design e UX / Geral')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Produto] ON 

INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (1, 1, N'001', N'Lógica de Programação: Crie seus primeiros programas usando Javascript e HTML', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (2, 1, N'002', N'Introdução à Computação: Da Lógica aos jogos com Ruby', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (3, 1, N'003', N'Scratch: Um jeito divertido de aprender programação', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (4, 1, N'004', N'Introdução à programação em C: Os primeiros passos de um desenvolvedor', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (5, 1, N'005', N'App Inventor: Seus primeiros aplicativos Android', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (6, 1, N'006', N'Construct 2: Crie o seu primeiro jogo multiplataforma', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (7, 2, N'007', N'Aplicações Java para a web com JSF e JPA', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (8, 2, N'008', N'Java SE 8 Programmer I: O guia para sua certificação Oracle Certified Associate', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (9, 2, N'009', N'SOA aplicado: Integrando com web services e além', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (10, 2, N'010', N'Design Patterns com Java: Projeto orientado a objetos guiado por padrões', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (11, 2, N'011', N'Spring MVC: Domine o principal framework web Java', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (12, 2, N'012', N'Vire o jogo com Spring Framework', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (13, 2, N'013', N'Orientação a Objetos e SOLID para Ninjas: Projetando classes flexíveis', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (14, 2, N'014', N'Test-Driven Development: Teste e Design no Mundo Real', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (15, 2, N'015', N'Introdução à Arquitetura e Design de Software: Uma visão sobre a plataforma Java', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (16, 2, N'016', N'Desbravando Java e Orientação a Objetos: Um guia para o iniciante da linguagem', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (17, 2, N'017', N'Java 8 Prático: Lambdas, Streams e os novos recursos da linguagem', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (18, 2, N'018', N'JSF Eficaz: As melhores práticas para o desenvolvedor web Java', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (19, 2, N'019', N'Testes automatizados de software: Um guia prático', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (20, 2, N'020', N'Java EE: Aproveite toda a plataforma para construir aplicações', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (21, 2, N'021', N'JPA Eficaz: As melhores práticas de persistência de dados em Java', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (22, 2, N'022', N'CDI: Integre as dependências e contextos do seu código Java', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (23, 2, N'023', N'JavaFX: Interfaces com qualidade para aplicações desktop', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (24, 2, N'024', N'VRaptor: Desenvolvimento ágil para web com Java', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (25, 2, N'025', N'Spring Boot: Acelere o desenvolvimento de microsserviços', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (26, 2, N'026', N'Orientação a Objetos: Aprenda seus conceitos e suas aplicabilidades de forma efetiva', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (27, 2, N'027', N'Componentes Reutilizáveis em Java com Reflexão e Anotações', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (28, 2, N'028', N'Segurança em aplicações Web', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (29, 2, N'029', N'Java 9: Interativo, reativo e modularizado', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (30, 2, N'030', N'Explorando APIs e bibliotecas Java: JDBC, IO, Threads, JavaFX e mais', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (31, 2, N'031', N'OAuth 2.0: Proteja suas aplicações com o Spring Security OAuth2', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (32, 2, N'032', N'A lógica do jogo: Recriando clássicos da história dos videogames', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (33, 2, N'033', N'Play Framework: Java para web sem Servlets e com diversão', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (34, 2, N'034', N'iReport: Crie relatórios práticos e elegantes', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (35, 2, N'035', N'Algoritmos em Java: Busca, ordenação e análise', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (36, 2, N'036', N'MundoJ: Segurança com Java', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (37, 2, N'037', N'Refatorando com padrões de projeto: Um guia em Java', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (38, 2, N'038', N'DSL: Quebre a barreira entre desenvolvimento e negócios', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (39, 3, N'039', N'Desenvolvimento web com ASP.NET MVC', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (40, 3, N'040', N'Test-Driven Development: Teste e Design no Mundo Real com .NET', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (41, 3, N'041', N'ASP.NET MVC5: Crie aplicações web na plataforma Microsoft®', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (42, 3, N'042', N'Orientação a Objetos: Aprenda seus conceitos e suas aplicabilidades de forma efetiva', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (43, 3, N'043', N'C# e Visual Studio: Desenvolvimento de aplicações desktop', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (44, 3, N'044', N'Web Services REST com ASP .NET Web API e Windows Azure', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (45, 3, N'045', N'ASP.NET Core MVC: Aplicações modernas em conjunto com o Entity Framework', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (46, 3, N'046', N'Orientação a Objetos em C#: Conceitos e implementações em .NET', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (47, 3, N'047', N'Programação funcional em .NET: Explore um novo universo', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (48, 4, N'048', N'Desenvolvimento web com PHP e MySQL', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (49, 4, N'049', N'PHP e Laravel: Crie aplicações web como um verdadeiro artesão', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (50, 4, N'050', N'Zend Certified Engineer: Descomplicando a certificação PHP', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (51, 4, N'051', N'CodeIgniter: Produtividade na criação de aplicações web em PHP', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (52, 4, N'052', N'Test-Driven Development: Teste e Design no Mundo Real com PHP', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (53, 4, N'053', N'Do PHP ao Zend Framework: Domine as boas práticas', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (54, 4, N'054', N'Coleção CodeIgniter + Zend PHP', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (55, 5, N'055', N'Introdução à Computação: Da Lógica aos jogos com Ruby', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (56, 5, N'056', N'A lógica do jogo: Recriando clássicos da história dos videogames', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (57, 5, N'057', N'Desenvolva jogos com HTML5 Canvas e JavaScript', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (58, 5, N'058', N'Desenvolvimento de Jogos para Android: Explore sua imaginação com o framework Cocos2D', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (59, 5, N'059', N'Desenvolvimento de Jogos para iOS: Explore sua imaginação com o framework Cocos2D', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (60, 5, N'060', N'Jogos em HTML5: Explore o mobile e física', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (61, 5, N'061', N'Jogos Android: Crie um game do zero usando classes nativas', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (62, 5, N'062', N'Lean Game Development: Desenvolvimento enxuto de jogos', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (63, 5, N'063', N'Construct 2: Crie o seu primeiro jogo multiplataforma', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (64, 6, N'064', N'Scala: Como escalar sua produtividade', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (65, 6, N'065', N'Elixir: Do zero à concorrência', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (66, 6, N'066', N'Haskell: Uma introdução à programação funcional', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (67, 6, N'067', N'OCaml: Programação funcional na prática', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (68, 6, N'068', N'Programação funcional em .NET: Explore um novo universo', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (69, 6, N'069', N'Programação Funcional e Concorrente em Rust', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (70, 7, N'070', N'Aplicações web real-time com Node.js', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (71, 7, N'071', N'REST: Construa API''s inteligentes de maneira simples', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (72, 7, N'072', N'Ruby on Rails: coloque sua aplicação web nos trilhos', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (73, 7, N'073', N'Mean: Full stack JavaScript para aplicações web com MongoDB, Express, Angular e Node', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (74, 7, N'074', N'Swift: Programe para iPhone e iPad', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (75, 7, N'075', N'Python: Escreva seus primeiros programas', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (76, 7, N'076', N'Ruby: Aprenda a programar na linguagem mais divertida', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (77, 7, N'077', N'Construindo APIs REST com Node.js', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (78, 7, N'078', N'Programando em Go: Crie aplicações com a linguagem do Google', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (79, 7, N'079', N'OAuth 2.0: Proteja suas aplicações com o Spring Security OAuth2', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (80, 7, N'080', N'Meteor: Criando aplicações web real-time com JavaScript', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (81, 7, N'081', N'Cucumber e RSpec: Construa aplicações Ruby com testes e especificações', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (82, 7, N'082', N'Falando de Grails: Altíssima produtividade no desenvolvimento web', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (83, 7, N'083', N'Guia do mestre programador: pensando como pirata, evoluindo como jedi', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (84, 7, N'084', N'Thoughtworks Antologia Brasil: Histórias de aprendizado e inovação', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (85, 7, N'085', N'Introdução à programação em C: Os primeiros passos de um desenvolvedor', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (86, 7, N'086', N'Test Driven Development: Teste e design no mundo real com Ruby', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (87, 7, N'087', N'Fragmentos de um programador: Artigos e insights da carreira de um profissional', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (88, 7, N'088', N'Desenvolvimento efetivo na plataforma Microsoft: Como desenvolver e suportar software que funciona', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (89, 7, N'089', N'Primeiros passos com Node.js', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (90, 7, N'090', N'RSpec: Crie especificações executáveis em Ruby', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (91, 7, N'091', N'ABAP: O guia de sobrevivência do profissional moderno', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (92, 7, N'092', N'Refatorando com padrões de projeto: Um guia em Ruby', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (93, 7, N'093', N'Microsoft Kinect: Crie aplicações interativas', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (94, 7, N'094', N'Canivete suíço do desenvolvedor Node', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (95, 7, N'095', N'DSL: Quebre a barreira entre desenvolvimento e negócios', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (96, 7, N'096', N'Octave: Seus primeiros passos na programação científica', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (97, 7, N'097', N'Rust: Concorrência e alta performance com segurança', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (98, 7, N'098', N'Programação Funcional e Concorrente em Rust', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (99, 8, N'099', N'Swift: Programe para iPhone e iPad', CAST(49.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (100, 8, N'100', N'iOS: Programe para iPhone e iPad', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (101, 8, N'101', N'Desenvolvimento de Jogos para iOS: Explore sua imaginação com o framework Cocos2D', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (102, 9, N'102', N'Google Android: crie aplicações para celulares e tablets', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (103, 9, N'103', N'Desenvolvimento de Jogos para Android: Explore sua imaginação com o framework Cocos2D', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (104, 9, N'104', N'Jogos Android: Crie um game do zero usando classes nativas', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (105, 9, N'105', N'Entrega contínua em Android: Como automatizar a distribuição de apps', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (106, 9, N'106', N'App Inventor: Seus primeiros aplicativos Android', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (107, 10, N'107', N'Aplicações mobile híbridas com Cordova e PhoneGap', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (108, 10, N'108', N'Xamarin Forms: Desenvolvimento de aplicações móveis multiplataforma', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (109, 10, N'109', N'Ionic Framework: Construa aplicativos para todas as plataformas mobile', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (110, 10, N'110', N'Cordova avançado e PhoneGap: Um guia detalhado do zero à publicação', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (111, 11, N'111', N'Criando aplicações para o seu Windows Phone', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (112, 11, N'112', N'Progressive Web Apps: Construa aplicações progressivas com React', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (113, 11, N'113', N'Criando aplicações para o seu Windows Phone - Edição Windows Runtime', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (114, 12, N'114', N'HTML5 e CSS3: Domine a web do futuro', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (115, 12, N'115', N'Web Design Responsivo: Páginas adaptáveis para todos os dispositivos', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (116, 12, N'116', N'A Web Mobile: Design Responsivo e além para uma Web adaptada ao mundo mobile', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (117, 12, N'117', N'Desenvolva jogos com HTML5 Canvas e JavaScript', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (118, 12, N'118', N'Coletânea Front-end: Uma antologia da comunidade front-end brasileira', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (119, 12, N'119', N'CSS Eficiente: Técnicas e ferramentas que fazem a diferença nos seus estilos', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (120, 12, N'120', N'Jogos em HTML5: Explore o mobile e física', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (121, 12, N'121', N'Sass: Aprendendo pré-processadores CSS', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (122, 12, N'122', N'Turbine seu CSS: Folhas de estilo inteligentes com Sass', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (123, 13, N'123', N'Dominando JavaScript com jQuery', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (124, 13, N'124', N'Mean: Full stack JavaScript para aplicações web com MongoDB, Express, Angular e Node', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (125, 13, N'125', N'Crie aplicações com Angular: O novo framework do Google', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (126, 13, N'126', N'Cangaceiro JavaScript: Uma aventura no sertão da programação', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (127, 13, N'127', N'Desenvolva jogos com HTML5 Canvas e JavaScript', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (128, 13, N'128', N'Coletânea Front-end: Uma antologia da comunidade front-end brasileira', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (129, 13, N'129', N'ECMAScript 6: Entre de cabeça no futuro do JavaScript', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (130, 13, N'130', N'Meteor: Criando aplicações web real-time com JavaScript', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (131, 13, N'131', N'Vue.js: Construa aplicações incríveis', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (132, 13, N'132', N'Front-end com Vue.js: Da teoria à prática sem complicações', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (133, 13, N'133', N'Protractor: Lições sobre testes end-to-end automatizados', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (134, 13, N'134', N'jQuery Mobile: Desenvolva interfaces para múltiplos dispositivos', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (135, 13, N'135', N'Ember.js: Conheça o framework para aplicações web ambiciosas', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (136, 14, N'136', N'Guia Front-End: O caminho das pedras para ser um dev Front-End', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (137, 14, N'137', N'Introdução à Web Semântica: A inteligência da informação', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (138, 14, N'138', N'Progressive Web Apps: Construa aplicações progressivas com React', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (139, 15, N'139', N'Desconstruindo a Web: As tecnologias por trás de uma requisição', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (140, 16, N'140', N'Desenvolvimento web com PHP e MySQL', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (141, 16, N'141', N'MongoDB: Construa novas aplicações com novas tecnologias', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (142, 16, N'142', N'Big Data: Técnicas e tecnologias para extração de valor dos dados', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (143, 16, N'143', N'MySQL: Comece com o principal banco de dados open source do mercado', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (144, 16, N'144', N'PL/SQL: Domine a linguagem do banco de dados Oracle', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (145, 16, N'145', N'SQL: Uma abordagem para bancos de dados Oracle', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (146, 16, N'146', N'Machine Learning: Introdução à classificação', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (147, 16, N'147', N'Elasticsearch: Consumindo dados real-time com ELK', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (148, 16, N'148', N'Business Intelligence: Implementar do jeito certo e a custo zero', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (149, 16, N'149', N'NoSQL: Como armazenar os dados de uma aplicação moderna', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (150, 16, N'150', N'Armazenando dados com Redis', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (151, 16, N'151', N'PostgreSQL: Banco de dados para aplicações web modernas', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (152, 17, N'152', N'Controlando versões com Git e GitHub', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (153, 17, N'153', N'DevOps na prática: entrega de software confiável e automatizada', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (154, 17, N'154', N'Containers com Docker: Do desenvolvimento à produção', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (155, 17, N'155', N'Caixa de Ferramentas DevOps: Um guia para construção, administração e arquitetura de sistemas modernos', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (156, 17, N'156', N'Jenkins: Automatize tudo sem complicações', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (157, 17, N'157', N'Começando com o Linux: Comandos, serviços e administração', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (158, 17, N'158', N'Segurança em aplicações Web', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (159, 17, N'159', N'Thoughtworks Antologia Brasil: Histórias de aprendizado e inovação', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (160, 17, N'160', N'Arduino: Guia para colocar suas ideias em prática', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (161, 17, N'161', N'Arduino prático: 10 projetos para executar, aprender, modificar e dominar o mundo', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (162, 17, N'162', N'Azure: Coloque suas plataformas e serviços no cloud', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (163, 17, N'163', N'Desenvolvimento efetivo na plataforma Microsoft: Como desenvolver e suportar software que funciona', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (164, 17, N'164', N'Google App Engine: Construindo serviços na nuvem', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (165, 17, N'165', N'Entrega contínua em Android: Como automatizar a distribuição de apps', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (166, 17, N'166', N'Windows Server 2012 R2: Estudo dirigido para MCSA prova 70-410', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (167, 18, N'167', N'Guia da Startup: Como startups e empresas estabelecidas podem criar produtos de software rentáveis', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (168, 18, N'168', N'Direto ao Ponto: Criando produtos de forma enxuta', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (169, 18, N'169', N'Thoughtworks Antologia Brasil: Histórias de aprendizado e inovação', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (170, 18, N'170', N'Economia do acesso: e os modelos de negócios baseados em compartilhamento, recorrência e assinatura', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (171, 18, N'171', N'A jornada do empreendedor: O herói da nossa Era', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (172, 18, N'172', N'Making it right: Gestão de produtos no mundo das startups', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (173, 19, N'173', N'SEO Prático: Seu site na primeira página das buscas', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (174, 19, N'174', N'Marketing de conteúdo: Estratégias para entregar o que seu público quer consumir', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (175, 20, N'175', N'Gestão de produtos de software: Como aumentar as chances de sucesso do seu software', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (176, 20, N'176', N'Métricas Ágeis: Obtenha melhores resultados em sua equipe', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (177, 20, N'177', N'Lean Enterprise: Como empresas de alta performance inovam em escala', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (178, 20, N'178', N'A jornada do empreendedor: O herói da nossa Era', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (179, 20, N'179', N'Making it right: Gestão de produtos no mundo das startups', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (180, 21, N'180', N'Scrum: Gestão ágil para projetos de sucesso', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (181, 21, N'181', N'Agile: Desenvolvimento de software com entregas frequentes e foco no valor de negócio', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (182, 21, N'182', N'Métricas Ágeis: Obtenha melhores resultados em sua equipe', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (183, 21, N'183', N'eXtreme Programming: Práticas para o dia a dia no desenvolvimento ágil de software', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (184, 21, N'184', N'Scrum 360: Um guia completo e prático de agilidade', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (185, 22, N'185', N'O Programador Apaixonado: Construindo uma carreira notável em desenvolvimento de software', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (186, 22, N'186', N'O Mantra da Produtividade: Aprimore sua produtividade com técnicas de foco e organização pessoal', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (187, 22, N'187', N'Learning 3.0: Como os profissionais criativos aprendem', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (188, 22, N'188', N'Lean Game Development: Desenvolvimento enxuto de jogos', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (189, 23, N'189', N'Introdução e boas práticas em UX Design', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (190, 23, N'190', N'Conhecendo o Adobe Photoshop CS6', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (191, 23, N'191', N'Edição e organização de fotos com Adobe Lightroom', CAST(49.90 AS Decimal(18, 2)))
INSERT [dbo].[Produto] ([Id], [CategoriaId], [Codigo], [Nome], [Preco]) VALUES (192, 23, N'192', N'Vale presente Casa do Código', CAST(49.90 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Produto] OFF
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190816164225_AreaCatalogo', N'3.1.2')
/****** Object:  Index [IX_Produto_CategoriaId]    Script Date: 25/02/2020 21:04:08 ******/
CREATE NONCLUSTERED INDEX [IX_Produto_CategoriaId] ON [dbo].[Produto]
(
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Categoria_CategoriaId] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categoria] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Categoria_CategoriaId]
GO
USE [master]
GO
ALTER DATABASE [CasaDoCodigo.Catalogo] SET  READ_WRITE 
GO
