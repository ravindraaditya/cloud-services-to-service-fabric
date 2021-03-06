SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Survey](
  [Id] [nvarchar](50) NOT NULL,
  [Title] [nvarchar](50) NOT NULL,
  [CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED([Id] ASC)
)
    
CREATE TABLE [dbo].[Question](
  [Id] [nvarchar](50) NOT NULL,
  [SurveyId] [nvarchar](50) NOT NULL,
  [QuestionText] [nvarchar](255) NOT NULL,
  [QuestionType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED([Id] ASC)
)

ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Survey] FOREIGN KEY([SurveyId])
  REFERENCES [dbo].[Survey] ([Id])
  ON DELETE CASCADE
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Survey]
    
CREATE TABLE [dbo].[PossibleAnswer](
  [Id] [nvarchar](50) NOT NULL,
  [QuestionId] [nvarchar](50) NOT NULL,
  [Answer] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_PossibleAnswer] PRIMARY KEY CLUSTERED([Id] ASC)
)

ALTER TABLE [dbo].[PossibleAnswer]  WITH CHECK ADD  CONSTRAINT [FK_PossibleAnswer_Question] FOREIGN KEY([QuestionId])
  REFERENCES [dbo].[Question] ([Id])
  ON DELETE CASCADE
ALTER TABLE [dbo].[PossibleAnswer] CHECK CONSTRAINT [FK_PossibleAnswer_Question]

CREATE TABLE [dbo].[Response](
  [Id] [nvarchar](50) NOT NULL,
  [SurveyId] [nvarchar](50) NOT NULL,
  [CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Response] PRIMARY KEY CLUSTERED([Id] ASC)
)

ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_Survey] FOREIGN KEY([SurveyId])
  REFERENCES [dbo].[Survey] ([Id])
  ON DELETE CASCADE
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_Survey]
    
CREATE TABLE [dbo].[QuestionResponse](
  [ResponseId] [nvarchar](50) NOT NULL,
  [QuestionId] [nvarchar](50) NOT NULL,
  [Answer] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_QuestionResponse] PRIMARY KEY CLUSTERED ([ResponseId] ASC, [QuestionId] ASC)
)

ALTER TABLE [dbo].[QuestionResponse]  WITH CHECK ADD  CONSTRAINT [FK_QuestionResponse_Response] FOREIGN KEY([ResponseId])
  REFERENCES [dbo].[Response] ([Id])
  ON DELETE CASCADE
ALTER TABLE [dbo].[QuestionResponse] CHECK CONSTRAINT [FK_QuestionResponse_Response]