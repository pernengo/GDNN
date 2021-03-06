USE [Sistema]
GO
/****** Object:  StoredProcedure [dbo].[INSERT_DateAgenda]    Script Date: 12/12/2018 2:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Creacion de procesos de almacenado */
ALTER PROCEDURE [dbo].[INSERT_DateAgenda](@dateReservacion datetime, @IdCliente bigint, @IdUsuario bigint, @IdTratamiento bigint, @Estado varchar(20), @IdBox bigint, @IdUnico varchar(50))
as
begin
	insert into AgendaTurnos (DateReservacion,IdCliente,IdUsuario,IdTratamiento,Estado,IdBox,IdUnico) values (@dateReservacion,@IdCliente,@IdUsuario,@IdTratamiento,@Estado,@IdBox,@IdUnico)
end
