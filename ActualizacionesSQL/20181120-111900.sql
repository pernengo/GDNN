USE [Sistema]
GO
/****** Object:  StoredProcedure [dbo].[Insert_MovimientoCliente]    Script Date: 11/20/2018 11:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Insert_MovimientoCliente](
@IdCliente bigint,
@TipoMovimiento varchar(3),
@Importe decimal(18,4),
@IdFactura bigint,
@Date varchar(100))
as
begin
insert into MovimientoClientes(
IdCliente,
TipoMovimiento,
Importe,
IdFactura,
Fecha
) values(@IdCliente,@TipoMovimiento,@Importe,@IdFactura,convert(datetime,@Date,120))
end

