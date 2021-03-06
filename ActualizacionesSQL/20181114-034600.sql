/*
   Tuesday, November 13, 20183:33:18 AM
   Usuario: sa
   Servidor: .\SQLEXPRESS
   Base de datos: Sistema
   Aplicación: 
*/
Use Sistema
GO
/* Para evitar posibles problemas de pérdida de datos, debe revisar este script detalladamente antes de ejecutarlo fuera del contexto del diseñador de base de datos.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tarjetas
	(
	Id bigint NOT NULL IDENTITY (1, 1),
	IdLocal bigint NOT NULL,
	Recargo decimal(18, 2) NOT NULL,
	NombreTarjeta varchar(50) NOT NULL,
	Available bit NOT NULL,
	RutaDeImagen varchar(250) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tarjetas ADD CONSTRAINT
	PK_Tarjetas PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Tarjetas SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
GO
CREATE PROCEDURE GetAllTarjetasByIdLocal(@idLocal bigint)
as
begin
select * from Tarjetas where IdLocal=@idLocal
end
go
Create Procedure GetTarjetaById(@IdTarjeta bigint)
as
begin
select * from Tarjetas where Id=@IdTarjeta
end
go
Create Procedure UpdateRecargoTarjetaById(@IdTarjeta bigint, @Recargo decimal(18,2))
as
begin
update Tarjetas set Recargo=@Recargo where Id=@IdTarjeta
end
go
Create Procedure UpdateAvailabilityTarjetaById(@IdTarjeta bigint, @State bit)
as
begin
update Tarjetas set Available=@State where Id=@IdTarjeta
end
go
Create Procedure UpdateNombreTarjetaById(@IdTarjeta bigint, @Nombre varchar(50))
as
begin
update Tarjetas set NombreTarjeta=@Nombre where Id=@IdTarjeta
end
go
Create Procedure GetAvailableTarjetasByIdLocal(@IdLocal bigint)
as
begin
select * from Tarjetas where IdLocal=@IdLocal and Available=1
end
go

