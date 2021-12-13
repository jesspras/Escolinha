CREATE TABLE [Alunos] (
	IdAluno uniqueidentifier  NOT NULL,
	Nome varchar(255) NOT NULL,
	Raca varchar(20) NOT NULL,
	DataNasc datetime NOT NULL,
	RG varchar(15) ,
	CPF varchar(12) ,
	CertidaoNascimento varchar(40) NOT NULL,
	PossuiBolsaFamilia varchar(3) NOT NULL,
	NIS varchar(255) ,
	SUS varchar(20) NOT NULL,
	AlergiaMed varchar(3) NOT NULL,
	AlergiaAlim varchar(3) NOT NULL,
	Alergias varchar(100) ,
	TipoTransporte varchar(50) NOT NULL,
	TelefoneTipoTrans varchar(15) ,
	Religiao varchar(50) NOT NULL,
	Presencial varchar(3) NOT NULL,
	Nacionalidade varchar(100) NOT NULL,
	Naturalidade varchar(100) NOT NULL,
	Ativo varchar(3) NOT NULL,
	Obs varchar(255) NOT NULL,
	DataMatricula datetime NOT NULL,
	Foto varchar(200),
  CONSTRAINT [PK_ALUNOS] PRIMARY KEY CLUSTERED
  (
  [IdAluno] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Funcionarios] (
	IdFuncionario uniqueidentifier  NOT NULL,
	Nome varchar(100) NOT NULL,
	dataNasc datetime NOT NULL,
	CargaHoraria integer NOT NULL,
	CPF varchar(12) ,
	RG varchar(12) ,
	TituloEleitoral varchar(20) ,
	NumeroCTPS varchar(20) ,
	SerieCTPS varchar(20) ,
	PIS varchar(20) ,
	Funcao varchar(100) NOT NULL,
	CBO varchar(10) ,
	Admissao datetime ,
	Ativo varchar(3) NOT NULL,
	Demissao datetime ,
	Remuneracao float ,
	Pai varchar(100) ,
	Mãe varchar(100) ,
	rua varchar(200) NOT NULL,
	numero integer NOT NULL,
	bairro varchar(200) NOT NULL,
	cidade varchar(200) NOT NULL,
	estado varchar(2) NOT NULL,
  CONSTRAINT [PK_FUNCIONARIOS] PRIMARY KEY CLUSTERED
  (
  [IdFuncionario] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Turmas] (
	IdTurma uniqueidentifier  NOT NULL,
	nome varchar(100) NOT NULL,
	turno varchar(10) NOT NULL,
	Capacidade integer NOT NULL,
  CONSTRAINT [PK_TURMAS] PRIMARY KEY CLUSTERED
  (
  [IdTurma] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Professores] (
	IdProfessor uniqueidentifier  NOT NULL,
	IdFuncionario uniqueidentifier  NOT NULL,
  CONSTRAINT [PK_PROFESSORES] PRIMARY KEY CLUSTERED
  (
  [IdProfessor] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Autorizados] (
	idAutorizado uniqueidentifier NOT NULL,
	Nome varchar(255) NOT NULL,
	Parentesco varchar(255) NOT NULL,
	Foto varchar(255) NOT NULL,
  CONSTRAINT [PK_AUTORIZADOS] PRIMARY KEY CLUSTERED
  (
  [idAutorizado] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Responsaveis] (
	IdResponsavel uniqueidentifier NOT NULL,
	Nome varchar(255) NOT NULL,
	DataNasc datetime NOT NULL,
	CPF varchar(12) NOT NULL,
	RG varchar(15) ,
	GrauInstrucao varchar(30) NOT NULL,
	Curso varchar(200) ,
	Profissao varchar(200) NOT NULL,
	TelefoneComercial varchar(12),
	TelefoneCelular varchar(12) NOT NULL,
	Parentesco varchar(20) NOT NULL,
	Email varchar(200),
	Foto varchar(200) NOT NULL,
	rua varchar(200) NOT NULL,
	numero integer NOT NULL,
	bairro varchar(200) NOT NULL,
	cidade varchar(200) NOT NULL,
	estado varchar(2) NOT NULL,
  CONSTRAINT [PK_RESPONSAVEIS] PRIMARY KEY CLUSTERED
  (
  [IdResponsavel] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [AutorizadoxAlunos] (
	Id uniqueidentifier  NOT NULL,
	IdAutorizado integer NOT NULL,
	IdAluno integer NOT NULL,
	Ativo varchar(3) NOT NULL,
  CONSTRAINT [PK_AUTORIZADOXALUNOS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [ResponsavelLegal] (
	IdResponsavelLegal uniqueidentifier  NOT NULL,
	IdAluno integer NOT NULL,
	IdResponsavel integer NOT NULL,
	
  CONSTRAINT [PK_RESPONSAVELLEGAL] PRIMARY KEY CLUSTERED
  (
  [IdResponsavelLegal] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [ProfessorTurma] (
	IdProfessorTurma uniqueidentifier  NOT NULL,
	IdTurma uniqueidentifier  NOT NULL,
	IdProfessor uniqueidentifier  NOT NULL,
  CONSTRAINT [PK_PROFESSORTURMA] PRIMARY KEY CLUSTERED
  (
  [IdProfessorTurma] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Historico] (
	idAlunoTurma uniqueidentifier  NOT NULL,
	idAluno uniqueidentifier  NOT NULL,
	idTurma uniqueidentifier  NOT NULL,
	arquivoHistorico varchar(255) ,
	ArquivoParecer varchar(255) ,
	Semestre varchar(10) NOT NULL,
	ano varchar(5) NOT NULL,
  CONSTRAINT [PK_HISTORICO] PRIMARY KEY CLUSTERED
  (
  [idAlunoTurma] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO



ALTER TABLE [Professores] WITH CHECK ADD CONSTRAINT [Professores_fk0] FOREIGN KEY ([IdFuncionario]) REFERENCES [Funcionarios]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Professores] CHECK CONSTRAINT [Professores_fk0]
GO



ALTER TABLE [AutorizadoxAlunos] WITH CHECK ADD CONSTRAINT [AutorizadoxAlunos_fk0] FOREIGN KEY ([IdAutorizado]) REFERENCES [Autorizados]([idAutorizado])
ON UPDATE CASCADE
GO
ALTER TABLE [AutorizadoxAlunos] CHECK CONSTRAINT [AutorizadoxAlunos_fk0]
GO
ALTER TABLE [AutorizadoxAlunos] WITH CHECK ADD CONSTRAINT [AutorizadoxAlunos_fk1] FOREIGN KEY ([IdAluno]) REFERENCES [Alunos]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [AutorizadoxAlunos] CHECK CONSTRAINT [AutorizadoxAlunos_fk1]
GO

ALTER TABLE [ResponsavelLegal] WITH CHECK ADD CONSTRAINT [ResponsavelLegal_fk0] FOREIGN KEY ([IdAluno]) REFERENCES [Alunos]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [ResponsavelLegal] CHECK CONSTRAINT [ResponsavelLegal_fk0]
GO
ALTER TABLE [ResponsavelLegal] WITH CHECK ADD CONSTRAINT [ResponsavelLegal_fk1] FOREIGN KEY ([IdResponsavel]) REFERENCES [Responsaveis]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [ResponsavelLegal] CHECK CONSTRAINT [ResponsavelLegal_fk1]
GO

ALTER TABLE [ProfessorTurma] WITH CHECK ADD CONSTRAINT [ProfessorTurma_fk0] FOREIGN KEY ([IdTurma]) REFERENCES [Turmas]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [ProfessorTurma] CHECK CONSTRAINT [ProfessorTurma_fk0]
GO
ALTER TABLE [ProfessorTurma] WITH CHECK ADD CONSTRAINT [ProfessorTurma_fk1] FOREIGN KEY ([IdProfessor]) REFERENCES [Professores]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [ProfessorTurma] CHECK CONSTRAINT [ProfessorTurma_fk1]
GO

ALTER TABLE [Historico] WITH CHECK ADD CONSTRAINT [Historico_fk0] FOREIGN KEY ([idAluno]) REFERENCES [Alunos]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Historico] CHECK CONSTRAINT [Historico_fk0]
GO
ALTER TABLE [Historico] WITH CHECK ADD CONSTRAINT [Historico_fk1] FOREIGN KEY ([idTurma]) REFERENCES [ProfessorTurma]([IdProfessorTurma])
ON UPDATE CASCADE
GO
ALTER TABLE [Historico] CHECK CONSTRAINT [Historico_fk1]
GO

