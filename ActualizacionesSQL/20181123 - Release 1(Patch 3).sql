USE [Sistema]
GO
/****** Object:  StoredProcedure [dbo].[INSERT_DateAgenda]    Script Date: 06/12/2018 1:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Creacion de procesos de almacenado */
CREATE PROCEDURE [dbo].[INSERT_DateAgenda](@dateReservacion datetime, @IdCliente bigint, @IdUsuario bigint, @IdTratamiento bigint, @Estado varchar(20))
as
begin
	insert into AgendaTurnos (DateReservacion,IdCliente,IdUsuario,IdTratamiento,Estado) values (@dateReservacion,@IdCliente,@IdUsuario,@IdTratamiento,@Estado)
end
