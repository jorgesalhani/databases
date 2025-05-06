CREATE TABLE Data (
  id_data SERIAL NOT NULL,
  data_checkin DATE NOT NULL,
  data_checkout DATE NOT NULL,
  CONSTRAINT pk_data PRIMARY KEY (id_data),
  CONSTRAINT dif_data CHECK (data_checkout > data_checkin)
)