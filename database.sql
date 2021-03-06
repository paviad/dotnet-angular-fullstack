USE [master]
GO
/****** Object:  Database [Take2]    Script Date: 13 Dec 2020 15:29:14 ******/
CREATE DATABASE [Take2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Take2', FILENAME = N'C:\Users\USER\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\Take2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Take2_log', FILENAME = N'C:\Users\USER\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\Take2.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Take2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Take2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Take2] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [Take2] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Take2] SET ANSI_PADDING ON 
GO
ALTER DATABASE [Take2] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [Take2] SET ARITHABORT ON 
GO
ALTER DATABASE [Take2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Take2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Take2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Take2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Take2] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [Take2] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [Take2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Take2] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [Take2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Take2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Take2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Take2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Take2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Take2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Take2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Take2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Take2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Take2] SET RECOVERY FULL 
GO
ALTER DATABASE [Take2] SET  MULTI_USER 
GO
ALTER DATABASE [Take2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Take2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Take2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Take2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Take2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Take2] SET QUERY_STORE = OFF
GO
USE [Take2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Take2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 13 Dec 2020 15:29:14 ******/
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
/****** Object:  Table [dbo].[Is4_ApiResourceClaims]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiResourceProperties]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiResources]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[AllowedAccessTokenSigningAlgorithms] [nvarchar](100) NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_Is4_ApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiResourceScopes]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiResourceScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiResourceScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiResourceSecrets]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiResourceSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiResourceSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiScopeClaims]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiScopeProperties]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiScopeProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiScopeProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiScopes]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_Is4_ApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetRoleClaims]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_is4_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetRoles]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_is4_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetUserClaims]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_is4_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetUserLogins]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_is4_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetUserRoles]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_is4_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetUsers]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_is4_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetUserTokens]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_is4_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientClaims]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientCorsOrigins]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientGrantTypes]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientGrantTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientIdPRestrictions]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientPostLogoutRedirectUris]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientProperties]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientRedirectUris]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_Clients]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ProtocolType] [nvarchar](200) NOT NULL,
	[RequireClientSecret] [bit] NOT NULL,
	[ClientName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[LogoUri] [nvarchar](2000) NULL,
	[RequireConsent] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [bit] NOT NULL,
	[RequirePkce] [bit] NOT NULL,
	[AllowPlainTextPkce] [bit] NOT NULL,
	[RequireRequestObject] [bit] NOT NULL,
	[AllowAccessTokensViaBrowser] [bit] NOT NULL,
	[FrontChannelLogoutUri] [nvarchar](2000) NULL,
	[FrontChannelLogoutSessionRequired] [bit] NOT NULL,
	[BackChannelLogoutUri] [nvarchar](2000) NULL,
	[BackChannelLogoutSessionRequired] [bit] NOT NULL,
	[AllowOfflineAccess] [bit] NOT NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[AllowedIdentityTokenSigningAlgorithms] [nvarchar](100) NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[ConsentLifetime] [int] NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[ClientClaimsPrefix] [nvarchar](200) NULL,
	[PairWiseSubjectSalt] [nvarchar](200) NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[UserSsoLifetime] [int] NULL,
	[UserCodeType] [nvarchar](100) NULL,
	[DeviceCodeLifetime] [int] NOT NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_Is4_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientScopes]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientSecrets]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_DeviceCodes]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_DeviceCodes](
	[UserCode] [nvarchar](200) NOT NULL,
	[DeviceCode] [nvarchar](200) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Is4_DeviceCodes] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_IdentityResourceClaims]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_IdentityResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_IdentityResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_IdentityResourceProperties]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_IdentityResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_IdentityResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_IdentityResources]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_IdentityResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_Is4_IdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_PersistedGrants]    Script Date: 13 Dec 2020 15:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_PersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[ConsumedTime] [datetime2](7) NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Is4_PersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200905120225_Configuration', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200905120326_PersistedGrant', N'3.1.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200905145851_Identity', N'3.1.7')
GO
SET IDENTITY_INSERT [dbo].[Is4_ApiScopes] ON 

INSERT [dbo].[Is4_ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (1, 1, N'scope2', N'scope2', NULL, 0, 0, 1)
INSERT [dbo].[Is4_ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (2, 1, N'scope1', N'scope1', NULL, 0, 0, 1)
INSERT [dbo].[Is4_ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (1002, 1, N'api', N'api', NULL, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Is4_ApiScopes] OFF
GO
INSERT [dbo].[is4_AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'37ee23f0-0508-49e6-81cd-4bff96d67750', N'test@test.com', N'TEST@TEST.COM', N'test@test.com', N'TEST@TEST.COM', 0, N'AQAAAAEAACcQAAAAEDFg0MfdmbUeohEDUhKpZ+AcE97zvbtFwhF6ME4/FSu97uRIyZe0m2Uc7GAihXMKbw==', N'WEITH4GWOSVCH44FEHQWR74YLTEW7R6U', N'd77d6766-09d8-44cd-9ad5-65effc870686', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Is4_ClientGrantTypes] ON 

INSERT [dbo].[Is4_ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (1, N'client_credentials', 1)
INSERT [dbo].[Is4_ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (2, N'authorization_code', 2)
SET IDENTITY_INSERT [dbo].[Is4_ClientGrantTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ClientPostLogoutRedirectUris] ON 

INSERT [dbo].[Is4_ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (1, N'https://localhost:44314/', 2)
SET IDENTITY_INSERT [dbo].[Is4_ClientPostLogoutRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ClientRedirectUris] ON 

INSERT [dbo].[Is4_ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (1, N'https://localhost:44314/callback', 2)
INSERT [dbo].[Is4_ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (2, N'https://localhost:44314/silent-renew.html', 2)
SET IDENTITY_INSERT [dbo].[Is4_ClientRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_Clients] ON 

INSERT [dbo].[Is4_Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (1, 1, N'm2m.client', N'oidc', 1, N'Client Credentials Client', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, NULL, 1, NULL, 1, 0, 300, NULL, 3600, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, CAST(N'2020-09-05T13:29:23.7518688' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
INSERT [dbo].[Is4_Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (2, 1, N'interactive', N'oidc', 1, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, N'https://localhost:44314/signout-oidc', 1, NULL, 1, 1, 300, NULL, 3600, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, CAST(N'2020-09-05T13:29:23.8618496' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
SET IDENTITY_INSERT [dbo].[Is4_Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ClientScopes] ON 

INSERT [dbo].[Is4_ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1, N'scope1', 1)
INSERT [dbo].[Is4_ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2, N'openid', 2)
INSERT [dbo].[Is4_ClientScopes] ([Id], [Scope], [ClientId]) VALUES (3, N'profile', 2)
INSERT [dbo].[Is4_ClientScopes] ([Id], [Scope], [ClientId]) VALUES (4, N'scope2', 2)
INSERT [dbo].[Is4_ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1002, N'email', 2)
INSERT [dbo].[Is4_ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1003, N'api', 2)
SET IDENTITY_INSERT [dbo].[Is4_ClientScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ClientSecrets] ON 

INSERT [dbo].[Is4_ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (1, NULL, N'fU7fRb+g6YdlniuSqviOLWNkda1M/MuPtH6zNI9inF8=', NULL, N'SharedSecret', CAST(N'2020-09-05T13:29:23.7521736' AS DateTime2), 1)
INSERT [dbo].[Is4_ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (2, NULL, N'o90IbCACXKUkunXoa18cODcLKnQTbjOo5ihEw9j58+8=', NULL, N'SharedSecret', CAST(N'2020-09-05T13:29:23.8618526' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[Is4_ClientSecrets] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_IdentityResourceClaims] ON 

INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (1, N'website', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (2, N'picture', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (3, N'profile', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (4, N'preferred_username', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (5, N'nickname', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (6, N'middle_name', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (7, N'given_name', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (8, N'family_name', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (9, N'name', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (10, N'gender', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (11, N'birthdate', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (12, N'zoneinfo', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (13, N'locale', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (14, N'updated_at', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (15, N'sub', 2)
SET IDENTITY_INSERT [dbo].[Is4_IdentityResourceClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_IdentityResources] ON 

INSERT [dbo].[Is4_IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (1, 1, N'profile', N'User profile', N'Your user profile information (first name, last name, etc.)', 0, 1, 1, CAST(N'2020-09-05T13:29:24.0865479' AS DateTime2), NULL, 0)
INSERT [dbo].[Is4_IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (2, 1, N'openid', N'Your user identifier', NULL, 1, 0, 1, CAST(N'2020-09-05T13:29:24.0707145' AS DateTime2), NULL, 0)
INSERT [dbo].[Is4_IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (1004, 1, N'email', N'Email', N'Email', 0, 0, 1, CAST(N'2020-12-13T00:00:00.0000000' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[Is4_IdentityResources] OFF
GO
INSERT [dbo].[Is4_PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'AGDMgPNdXGDYruXKZtshDldo+vPmRgaAxd+vYD7twbo=', N'authorization_code', N'37ee23f0-0508-49e6-81cd-4bff96d67750', N'C7C6DBBA48C6E6266D99B0827A671616', N'interactive', NULL, CAST(N'2020-12-13T12:43:57.0000000' AS DateTime2), CAST(N'2020-12-13T12:48:57.0000000' AS DateTime2), NULL, N'{"CreationTime":"2020-12-13T12:43:57Z","Lifetime":300,"ClientId":"interactive","Subject":{"AuthenticationType":"Identity.Application","Claims":[{"Type":"sub","Value":"37ee23f0-0508-49e6-81cd-4bff96d67750","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"AspNet.Identity.SecurityStamp","Value":"WEITH4GWOSVCH44FEHQWR74YLTEW7R6U","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"preferred_username","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email_verified","Value":"false","ValueType":"http://www.w3.org/2001/XMLSchema#boolean"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1607859193","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile","email","api"],"RedirectUri":"https://localhost:44314/silent-renew.html","Nonce":null,"StateHash":"kUSgfsmS5klLq8UmUTStPg","WasConsentShown":false,"SessionId":"C7C6DBBA48C6E6266D99B0827A671616","CodeChallenge":"F1wjAChmqxkb+SAeK/mgNmyL6PEJvyPe4YLj04DfKew=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[Is4_PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'DT+fiAsVp7Uu+YXixa47XclISLlba6VOCbERgjHe3nY=', N'authorization_code', N'37ee23f0-0508-49e6-81cd-4bff96d67750', N'C7C6DBBA48C6E6266D99B0827A671616', N'interactive', NULL, CAST(N'2020-12-13T12:44:30.0000000' AS DateTime2), CAST(N'2020-12-13T12:49:30.0000000' AS DateTime2), NULL, N'{"CreationTime":"2020-12-13T12:44:30Z","Lifetime":300,"ClientId":"interactive","Subject":{"AuthenticationType":"Identity.Application","Claims":[{"Type":"sub","Value":"37ee23f0-0508-49e6-81cd-4bff96d67750","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"AspNet.Identity.SecurityStamp","Value":"WEITH4GWOSVCH44FEHQWR74YLTEW7R6U","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"preferred_username","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email_verified","Value":"false","ValueType":"http://www.w3.org/2001/XMLSchema#boolean"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1607859193","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile","email","api"],"RedirectUri":"https://localhost:44314/silent-renew.html","Nonce":null,"StateHash":"HYBo4_ONIRKfARH9hDoh7g","WasConsentShown":false,"SessionId":"C7C6DBBA48C6E6266D99B0827A671616","CodeChallenge":"K7aw60c+9WRa3js3t237lE8y/OPqdvVSEtFE5xIkAJc=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[Is4_PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'Lp8OXQE06/i32XP0gy1PZewT4lxb4/uLJcAJUKOW4Qg=', N'authorization_code', N'37ee23f0-0508-49e6-81cd-4bff96d67750', N'C7C6DBBA48C6E6266D99B0827A671616', N'interactive', NULL, CAST(N'2020-12-13T12:46:00.0000000' AS DateTime2), CAST(N'2020-12-13T12:51:00.0000000' AS DateTime2), NULL, N'{"CreationTime":"2020-12-13T12:46:00Z","Lifetime":300,"ClientId":"interactive","Subject":{"AuthenticationType":"Identity.Application","Claims":[{"Type":"sub","Value":"37ee23f0-0508-49e6-81cd-4bff96d67750","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"AspNet.Identity.SecurityStamp","Value":"WEITH4GWOSVCH44FEHQWR74YLTEW7R6U","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"preferred_username","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email_verified","Value":"false","ValueType":"http://www.w3.org/2001/XMLSchema#boolean"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1607859193","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile","email","api"],"RedirectUri":"https://localhost:44314/silent-renew.html","Nonce":null,"StateHash":"5kC2RckUNfAHvAKtTwLoUg","WasConsentShown":false,"SessionId":"C7C6DBBA48C6E6266D99B0827A671616","CodeChallenge":"qnthoDDdZQO04Yv0uPvMwNIwfvUDOGPzBUJibRxCUNk=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[Is4_PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'Lv5ei4oRT3FMdzNOaLpAp2JNm9Rv8s2beGVk49ASqMU=', N'authorization_code', N'37ee23f0-0508-49e6-81cd-4bff96d67750', N'FF1C16C9A7AFA1DBAF5C426A242686EE', N'interactive', NULL, CAST(N'2020-12-13T12:59:43.0000000' AS DateTime2), CAST(N'2020-12-13T13:04:43.0000000' AS DateTime2), NULL, N'{"CreationTime":"2020-12-13T12:59:43Z","Lifetime":300,"ClientId":"interactive","Subject":{"AuthenticationType":"Identity.Application","Claims":[{"Type":"sub","Value":"37ee23f0-0508-49e6-81cd-4bff96d67750","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"AspNet.Identity.SecurityStamp","Value":"WEITH4GWOSVCH44FEHQWR74YLTEW7R6U","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"preferred_username","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email_verified","Value":"false","ValueType":"http://www.w3.org/2001/XMLSchema#boolean"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1607864094","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile","email","api"],"RedirectUri":"https://localhost:44314/silent-renew.html","Nonce":null,"StateHash":"x8rX1fmwffEpg26aucUL7A","WasConsentShown":false,"SessionId":"FF1C16C9A7AFA1DBAF5C426A242686EE","CodeChallenge":"/CEwnCvuUIj9PWwCCvVfGQARix7NATov6LJf/AQwDco=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
INSERT [dbo].[Is4_PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'rAiBgC1VTEC7vKGt4CpD6eAzq7pvRz/vtC5YzLZulhk=', N'authorization_code', N'37ee23f0-0508-49e6-81cd-4bff96d67750', N'C7C6DBBA48C6E6266D99B0827A671616', N'interactive', NULL, CAST(N'2020-12-13T12:47:20.0000000' AS DateTime2), CAST(N'2020-12-13T12:52:20.0000000' AS DateTime2), NULL, N'{"CreationTime":"2020-12-13T12:47:20Z","Lifetime":300,"ClientId":"interactive","Subject":{"AuthenticationType":"Identity.Application","Claims":[{"Type":"sub","Value":"37ee23f0-0508-49e6-81cd-4bff96d67750","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"AspNet.Identity.SecurityStamp","Value":"WEITH4GWOSVCH44FEHQWR74YLTEW7R6U","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"preferred_username","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"name","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email","Value":"test@test.com","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"email_verified","Value":"false","ValueType":"http://www.w3.org/2001/XMLSchema#boolean"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1607859193","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}]},"IsOpenId":true,"RequestedScopes":["openid","profile","email","api"],"RedirectUri":"https://localhost:44314/silent-renew.html","Nonce":null,"StateHash":"fV-abxXv1UY_Zq35AFTWWA","WasConsentShown":false,"SessionId":"C7C6DBBA48C6E6266D99B0827A671616","CodeChallenge":"c+giLRubbCThfOKW0SUncXSCMEYcdsBb/2VEpnjDFUA=","CodeChallengeMethod":"S256","Description":null,"Properties":{}}')
GO
/****** Object:  Index [IX_Is4_ApiResourceClaims_ApiResourceId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiResourceClaims_ApiResourceId] ON [dbo].[Is4_ApiResourceClaims]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ApiResourceProperties_ApiResourceId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiResourceProperties_ApiResourceId] ON [dbo].[Is4_ApiResourceProperties]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_ApiResources_Name]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Is4_ApiResources_Name] ON [dbo].[Is4_ApiResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ApiResourceScopes_ApiResourceId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiResourceScopes_ApiResourceId] ON [dbo].[Is4_ApiResourceScopes]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ApiResourceSecrets_ApiResourceId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiResourceSecrets_ApiResourceId] ON [dbo].[Is4_ApiResourceSecrets]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ApiScopeClaims_ScopeId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiScopeClaims_ScopeId] ON [dbo].[Is4_ApiScopeClaims]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ApiScopeProperties_ScopeId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiScopeProperties_ScopeId] ON [dbo].[Is4_ApiScopeProperties]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_ApiScopes_Name]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Is4_ApiScopes_Name] ON [dbo].[Is4_ApiScopes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_is4_AspNetRoleClaims_RoleId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_is4_AspNetRoleClaims_RoleId] ON [dbo].[is4_AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[is4_AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_is4_AspNetUserClaims_UserId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_is4_AspNetUserClaims_UserId] ON [dbo].[is4_AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_is4_AspNetUserLogins_UserId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_is4_AspNetUserLogins_UserId] ON [dbo].[is4_AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_is4_AspNetUserRoles_RoleId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_is4_AspNetUserRoles_RoleId] ON [dbo].[is4_AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[is4_AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[is4_AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientClaims_ClientId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientClaims_ClientId] ON [dbo].[Is4_ClientClaims]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientCorsOrigins_ClientId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientCorsOrigins_ClientId] ON [dbo].[Is4_ClientCorsOrigins]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientGrantTypes_ClientId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientGrantTypes_ClientId] ON [dbo].[Is4_ClientGrantTypes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientIdPRestrictions_ClientId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientIdPRestrictions_ClientId] ON [dbo].[Is4_ClientIdPRestrictions]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientPostLogoutRedirectUris_ClientId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientPostLogoutRedirectUris_ClientId] ON [dbo].[Is4_ClientPostLogoutRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientProperties_ClientId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientProperties_ClientId] ON [dbo].[Is4_ClientProperties]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientRedirectUris_ClientId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientRedirectUris_ClientId] ON [dbo].[Is4_ClientRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_Clients_ClientId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Is4_Clients_ClientId] ON [dbo].[Is4_Clients]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientScopes_ClientId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientScopes_ClientId] ON [dbo].[Is4_ClientScopes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientSecrets_ClientId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientSecrets_ClientId] ON [dbo].[Is4_ClientSecrets]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_DeviceCodes_DeviceCode]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Is4_DeviceCodes_DeviceCode] ON [dbo].[Is4_DeviceCodes]
(
	[DeviceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_DeviceCodes_Expiration]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_DeviceCodes_Expiration] ON [dbo].[Is4_DeviceCodes]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_IdentityResourceClaims_IdentityResourceId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_IdentityResourceClaims_IdentityResourceId] ON [dbo].[Is4_IdentityResourceClaims]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_IdentityResourceProperties_IdentityResourceId]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_IdentityResourceProperties_IdentityResourceId] ON [dbo].[Is4_IdentityResourceProperties]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_IdentityResources_Name]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Is4_IdentityResources_Name] ON [dbo].[Is4_IdentityResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_PersistedGrants_Expiration]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_PersistedGrants_Expiration] ON [dbo].[Is4_PersistedGrants]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_PersistedGrants_SubjectId_ClientId_Type]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_PersistedGrants_SubjectId_ClientId_Type] ON [dbo].[Is4_PersistedGrants]
(
	[SubjectId] ASC,
	[ClientId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_PersistedGrants_SubjectId_SessionId_Type]    Script Date: 13 Dec 2020 15:29:15 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_PersistedGrants_SubjectId_SessionId_Type] ON [dbo].[Is4_PersistedGrants]
(
	[SubjectId] ASC,
	[SessionId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Is4_ApiResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiResourceClaims_Is4_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[Is4_ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiResourceClaims] CHECK CONSTRAINT [FK_Is4_ApiResourceClaims_Is4_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[Is4_ApiResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiResourceProperties_Is4_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[Is4_ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiResourceProperties] CHECK CONSTRAINT [FK_Is4_ApiResourceProperties_Is4_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[Is4_ApiResourceScopes]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiResourceScopes_Is4_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[Is4_ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiResourceScopes] CHECK CONSTRAINT [FK_Is4_ApiResourceScopes_Is4_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[Is4_ApiResourceSecrets]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiResourceSecrets_Is4_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[Is4_ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiResourceSecrets] CHECK CONSTRAINT [FK_Is4_ApiResourceSecrets_Is4_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[Is4_ApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiScopeClaims_Is4_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[Is4_ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiScopeClaims] CHECK CONSTRAINT [FK_Is4_ApiScopeClaims_Is4_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[Is4_ApiScopeProperties]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiScopeProperties_Is4_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[Is4_ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiScopeProperties] CHECK CONSTRAINT [FK_Is4_ApiScopeProperties_Is4_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[is4_AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetRoleClaims_is4_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[is4_AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetRoleClaims] CHECK CONSTRAINT [FK_is4_AspNetRoleClaims_is4_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[is4_AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetUserClaims_is4_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[is4_AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetUserClaims] CHECK CONSTRAINT [FK_is4_AspNetUserClaims_is4_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[is4_AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetUserLogins_is4_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[is4_AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetUserLogins] CHECK CONSTRAINT [FK_is4_AspNetUserLogins_is4_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[is4_AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetUserRoles_is4_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[is4_AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetUserRoles] CHECK CONSTRAINT [FK_is4_AspNetUserRoles_is4_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[is4_AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetUserRoles_is4_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[is4_AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetUserRoles] CHECK CONSTRAINT [FK_is4_AspNetUserRoles_is4_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[is4_AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetUserTokens_is4_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[is4_AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetUserTokens] CHECK CONSTRAINT [FK_is4_AspNetUserTokens_is4_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Is4_ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientClaims_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientClaims] CHECK CONSTRAINT [FK_Is4_ClientClaims_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientCorsOrigins_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientCorsOrigins] CHECK CONSTRAINT [FK_Is4_ClientCorsOrigins_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientGrantTypes_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientGrantTypes] CHECK CONSTRAINT [FK_Is4_ClientGrantTypes_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientIdPRestrictions_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientIdPRestrictions] CHECK CONSTRAINT [FK_Is4_ClientIdPRestrictions_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientPostLogoutRedirectUris_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_Is4_ClientPostLogoutRedirectUris_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientProperties_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientProperties] CHECK CONSTRAINT [FK_Is4_ClientProperties_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientRedirectUris_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientRedirectUris] CHECK CONSTRAINT [FK_Is4_ClientRedirectUris_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientScopes_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientScopes] CHECK CONSTRAINT [FK_Is4_ClientScopes_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientSecrets_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientSecrets] CHECK CONSTRAINT [FK_Is4_ClientSecrets_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_IdentityResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_Is4_IdentityResourceClaims_Is4_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[Is4_IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_IdentityResourceClaims] CHECK CONSTRAINT [FK_Is4_IdentityResourceClaims_Is4_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[Is4_IdentityResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_Is4_IdentityResourceProperties_Is4_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[Is4_IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_IdentityResourceProperties] CHECK CONSTRAINT [FK_Is4_IdentityResourceProperties_Is4_IdentityResources_IdentityResourceId]
GO
USE [master]
GO
ALTER DATABASE [Take2] SET  READ_WRITE 
GO
