USE [Sistema]
GO
/****** Object:  StoredProcedure [dbo].[Delete_TurnosByIdUnico]    Script Date: 12/12/2018 3:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Delete_TurnosByIdUnico] (@IdUnico varchar(50))
as
begin
delete from AgendaTurnos where IdUnico=@IdUnico;
end
