
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/08/2015 18:02:33
-- Generated from EDMX file: C:\Users\hgx95\Desktop\IHC PROYECTO SM\Examen\ExamenDAL\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [IHC];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Auction_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Auction] DROP CONSTRAINT [FK_Auction_User];
GO
IF OBJECT_ID(N'[dbo].[FK_AuctionRecord_Auction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AuctionRecord] DROP CONSTRAINT [FK_AuctionRecord_Auction];
GO
IF OBJECT_ID(N'[dbo].[FK_AuctionRecord_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AuctionRecord] DROP CONSTRAINT [FK_AuctionRecord_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Auction]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Auction];
GO
IF OBJECT_ID(N'[dbo].[AuctionRecord]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AuctionRecord];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Auction'
CREATE TABLE [dbo].[Auction] (
    [AuctionId] int  NOT NULL,
    [ProductName] varchar(50)  NOT NULL,
    [Description] varchar(100)  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [HighestBid] decimal(9,2)  NULL,
    [Winner] int  NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'AuctionRecord'
CREATE TABLE [dbo].[AuctionRecord] (
    [RecordId] int  NOT NULL,
    [AuctionId] int  NOT NULL,
    [UserId] int  NOT NULL,
    [Amount] decimal(9,2)  NOT NULL,
    [BidDate] datetime  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [UserId] int  NOT NULL,
    [UserName] varchar(10)  NOT NULL,
    [Password] varchar(10)  NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Email] varchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AuctionId] in table 'Auction'
ALTER TABLE [dbo].[Auction]
ADD CONSTRAINT [PK_Auction]
    PRIMARY KEY CLUSTERED ([AuctionId] ASC);
GO

-- Creating primary key on [RecordId] in table 'AuctionRecord'
ALTER TABLE [dbo].[AuctionRecord]
ADD CONSTRAINT [PK_AuctionRecord]
    PRIMARY KEY CLUSTERED ([RecordId] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [UserId] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'Auction'
ALTER TABLE [dbo].[Auction]
ADD CONSTRAINT [FK_Auction_User]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[User]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Auction_User'
CREATE INDEX [IX_FK_Auction_User]
ON [dbo].[Auction]
    ([UserId]);
GO

-- Creating foreign key on [AuctionId] in table 'AuctionRecord'
ALTER TABLE [dbo].[AuctionRecord]
ADD CONSTRAINT [FK_AuctionRecord_Auction]
    FOREIGN KEY ([AuctionId])
    REFERENCES [dbo].[Auction]
        ([AuctionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AuctionRecord_Auction'
CREATE INDEX [IX_FK_AuctionRecord_Auction]
ON [dbo].[AuctionRecord]
    ([AuctionId]);
GO

-- Creating foreign key on [UserId] in table 'AuctionRecord'
ALTER TABLE [dbo].[AuctionRecord]
ADD CONSTRAINT [FK_AuctionRecord_User]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[User]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AuctionRecord_User'
CREATE INDEX [IX_FK_AuctionRecord_User]
ON [dbo].[AuctionRecord]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------