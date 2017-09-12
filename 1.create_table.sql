-- Table: public.party_type
DROP TABLE IF EXISTS party_relationship;
DROP TABLE IF EXISTS party_relationship_type;
DROP TABLE IF EXISTS party_postal_locator;
DROP TABLE IF EXISTS party_lccator_type;

DROP TABLE IF EXISTS party;
DROP TABLE if exists party_type;

CREATE TABLE party_type
(
  party_type_id VARCHAR(40) NOT NULL, 
  description VARCHAR(255),
  last_updated_stamp timestamp without time zone,
  last_updated_tx_stamp timestamp without time zone,
  created_stamp timestamp without time zone,
  created_tx_stamp timestamp without time zone,
  
  CONSTRAINT party_type_pkey PRIMARY KEY (party_type_id)
 );


CREATE TABLE party (
   party_id INT NOT NULL,
   party_type_id VARCHAR(40),
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  
  CONSTRAINT party_pkey PRIMARY KEY (party_id),
   CONSTRAINT party_pty_typ FOREIGN KEY (party_type_id)
      REFERENCES party_type (party_type_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
  );

CREATE TABLE party_relationship_type(
	id int NOT NULL,
	name varchar(250) NOT NULL DEFAULT '',
	first_role_name varchar(255) DEFAULT NULL,
	second_role_name varchar(255) DEFAULT NULL,
	
	CONSTRAINT party_relation_type_pkey PRIMARY KEY (id)
);

CREATE TABLE party_relationship(
	id int NOT NULL,
	relation_type_id INT NOT NULL,
	first_party_id int NOT NULL,
	second_party_id int NOT NULL,
	begin_date date default NULL,
	end_date date default NULL,

	CONSTRAINT party_relationship_pkey PRIMARY KEY(ID),
	CONSTRAINT party_relationshpi_type_fkey FOREIGN KEY(relation_type_id)
		REFERENCES party_relationship_type(id),
	CONSTRAINT party_fkey_1 FOREIGN KEY(first_party_id)
		REFERENCES party(party_id),
	CONSTRAINT party_fkey_2 FOREIGN KEY(second_party_id)
		REFERENCES party(party_id)
		
);

CREATE TABLE party_locator_type (
	id int NOT NULL,

	CONSTRAINT party_locatory_type_pkey PRIMARY KEY(id)
);

CREATE TABLE party_postal_locator(
	id int not null,
	locator_type_id INT NOT NULL,

	CONSTRAINT party_postal_locator_pkey PRIMARY KEY(id),
	CONSTRAINT party_postal_locator_fkey FOREIGN KEY(locator_type_id)
		REFERENCES party_locator_type(id)
);
	