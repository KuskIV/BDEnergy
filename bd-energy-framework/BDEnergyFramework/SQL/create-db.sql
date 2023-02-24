CREATE TABLE Configuration (
  Id INT NOT NULL AUTO_INCREMENT,
  MinimumTemperature INT,
  MaximumTemperature INT,
  Burnin INT,
  AllocatedCores JSON

  PRIMARY KEY (id)
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

  PRIMARY KEY (id)
);

CREATE TABLE DeviceUnderTest(
  Id INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100),
  Os VARCHAR(100),

  PRIMARY KEY (id)
);

CREATE TABLE MeasurementInstrument(
  Id INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100),

  PRIMARY KEY (id)
);

CREATE TABLE MeasurementCollection(
  Id INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100),
  Iteration INT,
  ConfigurationId INT,
  TestCaseId INT,
  DutId INT,
  MeasuringInstrumentId INT,
  AdditionalMetadata INT,

  PRIMARY KEY (id)
);

CREATE TABLE Sample(
  Id INT NOT NULL AUTO_INCREMENT,
  CollectionId INT,
  PackageTemperature DECIMAL,
  ElapsedTime DECIMAL,
  ProcessorPowerInWatt DECIMAL,
  DramEnergyInJoules DECIMAL,
  GpuEnergyInJoules DECIMAL,
  CpuEnergyInJoules DECIMAL,
  CpuUtilization DECIMAL,
  AdditionalMetadata JSON,

  PRIMARY KEY (id)
);

CREATE TABLE Measurement(
  Id INT NOT NULL AUTO_INCREMENT,
  CollectionId INT,
  PackageTemperatureBegin DECIMAL,
  PackageTemperatureEnd DECIMAL,
  Duration DECIMAL,
  DramEnergyInJoules DECIMAL,
  GpuEnergyInJoules DECIMAL,
  CpuEnergyInJoules DECIMAL,
  BeginTime DateTime
  EndTime DateTime
  AdditionalMetadata JSON,

  PRIMARY KEY (id)
);

