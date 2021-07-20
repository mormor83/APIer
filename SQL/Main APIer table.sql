SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MON].[APIer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MethodID] [int] NOT NULL,
	[Body] [nvarchar](max) NULL,
	[Headers] [nvarchar](max) NULL,
	[DelayInMiliseconds] [int] NULL,
	[URI] [nvarchar](1000) NOT NULL,
	[StatusID] [int] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[UpdateDate] [datetime2](7) NOT NULL,
	[Ticket] [nvarchar](200) NULL,
	[RequestedUser] [varchar](250) NOT NULL,
	[ResponseBody] [nvarchar](max) NULL
 CONSTRAINT [PK_APIer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [MON].[APIer]  WITH CHECK ADD  CONSTRAINT [FK_MethodID] FOREIGN KEY([MethodID])
REFERENCES [MON].[APIerMethods] ([MethodID])
GO

ALTER TABLE [MON].[APIer] CHECK CONSTRAINT [FK_MethodID]
GO

ALTER TABLE [MON].[APIer]  WITH CHECK ADD  CONSTRAINT [Body record should be formatted as JSON] CHECK  ((isjson([Body])=(1)))
GO

ALTER TABLE [MON].[APIer] CHECK CONSTRAINT [Body record should be formatted as JSON]
GO

