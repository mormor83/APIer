SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [MON].[GetAutomationAPIerData]
AS
    BEGIN
        SELECT TOP 5000
              ai.ID
              ,aim.MethodDescription
              ,ai.Body
              ,ai.Headers
              ,ai.DelayInMiliseconds
              ,ai.URI
              ,ai.PBI
        INTO  #TempAPIer
        FROM  <TABLE>.MON.APIer AS ai 
        JOIN  <TABLE>.MON.APIerMethods AS aim WITH ( NOLOCK )
              ON aim.MethodID = ai.MethodID
        WHERE  ai.StatusID = 0
              AND ai.IsManual = 0


        UPDATE <TABLE>.MON.APIer
        SET    StatusID = 1
              ,UpdateDate = GETDATE()
        WHERE  ID IN ( SELECT ID FROM #TempAPIer );


        SELECT * FROM #TempAPIer WITH ( NOLOCK );

        DROP TABLE #TempAPIer;

    END;

GO

