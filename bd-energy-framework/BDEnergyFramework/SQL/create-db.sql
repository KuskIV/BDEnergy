CREATE TABLE Configuration (
  Id INT NOT NULL AUTO_INCREMENT,
  MinimumTemperature INT,
  MaximumTemperature INT,
  Burnin INT,
  AllocatedCores JSON,

  PRIMARY KEY (Id)
);


CREATE TABLE TestCase(
  Id INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100),
  Compiler VARCHAR(100),
  Language VARCHAR(100),
  Optimizations VARCHAR(100),
  TestCaseSize VARCHAR(100),
  Parameter VARCHAR(100),
  Threads VARCHAR(100),

  PRIMARY KEY (Id)
);

CREATE TABLE DeviceUnderTest(
  Id INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100),
  Os VARCHAR(100),

  PRIMARY KEY (Id)
);

CREATE TABLE MeasuringInstrument(
  Id INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100),

  PRIMARY KEY (Id)
);

CREATE TABLE MeasuringCollection(
  Id INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100),
  ConfigurationId INT,
  TestCaseId INT,
  DutId INT,
  MeasuringInstrumentId INT,
  AdditionalMetadata JSON,
  CollectionNumber INT,

  PRIMARY KEY (Id)
);

CREATE TABLE Sample(
  Id INT NOT NULL AUTO_INCREMENT,
  CollectionId INT,
  PackageTemperature DOUBLE,
  ElapsedTime DOUBLE,
  ProcessorPowerInWatt DOUBLE,
  DramEnergyInJoules DOUBLE,
  GpuEnergyInJoules DOUBLE,
  CpuEnergyInJoules DOUBLE,
  CpuUtilization DOUBLE,
  AdditionalMetadata JSON,

  PRIMARY KEY (Id)
);

CREATE TABLE Measurement(
  Id INT NOT NULL AUTO_INCREMENT,
  Iteration INT,
  CollectionId INT,
  PackageTemperatureBegin DOUBLE,
  PackageTemperatureEnd DOUBLE,
  Duration DOUBLE,
  DramEnergyInJoules DOUBLE,
  GpuEnergyInJoules DOUBLE,
  CpuEnergyInJoules DOUBLE,
  BeginTime TIMESTAMP,
  EndTime TIMESTAMP,
  AdditionalMetadata JSON,

  PRIMARY KEY (Id)
);

