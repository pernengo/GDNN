USE [Sistema]
GO
/****** Object:  StoredProcedure [dbo].[SELECT_DateAgendaSinAsignarByIdCliente]    Script Date: 20/12/2018 15:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECT_DateAgendaSinAsignarByIdCliente](@IdUser bigint, @IdCliente bigint)
as
begin 
select * from AgendaTurnos where IdCliente=@IdCliente and IdUsuario=@IdUser and Estado='NoAsignado';
end
