-------------creamos los ENUMs para estandarizar opciones
CREATE TYPE company_size_enum AS ENUM ('1-10', '11-50', '51-200', '201-500', '500+');
CREATE TYPE lead_status_enum AS ENUM ('NEW', 'CONTACTED', 'QUALIFIED', 'LOST');


----------------creacion de tablas
  
--tabla de Empresas (Companies)
CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    industry_category VARCHAR(50) NOT NULL,--(ex. tech, marketing, Accounting firm, etc)
    size company_size_enum --cantidad de empleados de la empresa
);

--tabla de Contactos (Leads)
CREATE TABLE leads (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    work_email VARCHAR(100) NOT NULL UNIQUE,
    company_id INT,
    lead_score INT,--calificación numérica que le vamos a dar nosotros al potencial cliente
    status lead_status_enum DEFAULT 'NEW',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (company_id) REFERENCES companies(id)
);