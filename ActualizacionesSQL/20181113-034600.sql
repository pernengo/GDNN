USE Sistema
GO
CREATE PROCEDURE INSERT_TARJETA(@Idlocal bigint, @Recargo decimal(18,2), @NombreTarjeta varchar(50))
as
begin
	insert into Tarjeta(IdLocal, Recargo, NombreTarjeta,Available) values (@IdLocal,@Recargo,@NombreTarjeta,1)
end