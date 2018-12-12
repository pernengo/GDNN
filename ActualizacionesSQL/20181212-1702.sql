USE [Sistema]
GO
/****** Object:  StoredProcedure [dbo].[select_allSuppliers]    Script Date: 12/12/2018 17:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[select_allSuppliers](@idUser bigint)
as
begin
SELECT Supplier.Id,Supplier.Nombre,Supplier.NombreFantasía, Supplier.Teléfono1, Supplier.Detalle as 'Telefono', Supplier.MailContacto as 'Mail'
  FROM Supplier WHERE Supplier.IdUser = @idUser
  end


