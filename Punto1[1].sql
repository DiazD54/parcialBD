--Punto 1

CREATE TYPE status AS ENUM ('Athlete', 'Alternate Athlete');

-- Crear la tabla COUNTRIES
CREATE TABLE countries (
    country_code CHAR(3) PRIMARY KEY,
    country VARCHAR(100) NOT NULL,
    country_full VARCHAR(255) NOT NULL
);

-- Crear la tabla DISCIPLINES
CREATE TABLE disciplines (
    discipline_code SERIAL PRIMARY KEY,
    discipline_name VARCHAR(100) NOT NULL
);

-- Crear la tabla EVENTS
CREATE TABLE events (
    event_code SERIAL PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL
);

-- Crear la tabla ATHLETES con la columna function
CREATE TABLE athletes (
    code CHAR(7) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    name_short VARCHAR(50),
    name_tv VARCHAR(50),
    height DECIMAL(5, 2),
    weight DECIMAL(5, 2),
    birth_date DATE,
    country_code CHAR(3),
    function status NOT NULL,
    FOREIGN KEY (country_code) REFERENCES countries(country_code)
);

-- Crear la tabla ATHLETESXDISCIPLINES (relación muchos a muchos)
CREATE TABLE athletesxdisciplines (
    athlete_code CHAR(7),
    discipline_code INT,
    PRIMARY KEY (athlete_code, discipline_code),
    FOREIGN KEY (athlete_code) REFERENCES athletes(code) ON DELETE CASCADE,
    FOREIGN KEY (discipline_code) REFERENCES disciplines(discipline_code) ON DELETE CASCADE
);

-- Crear la tabla ATHLETESXEVENTS (relación muchos a muchos)
CREATE TABLE athletesxevents (
    athlete_code CHAR(7),
    event_code INT,
    PRIMARY KEY (athlete_code, event_code),
    FOREIGN KEY (athlete_code) REFERENCES athletes(code) ON DELETE CASCADE,
    FOREIGN KEY (event_code) REFERENCES events(event_code) ON DELETE CASCADE
);

-- Crear la tabla olympics_staging
CREATE TABLE olympics_staging (
    code CHAR(7),
    name VARCHAR(100),
    name_short VARCHAR(50),
    name_tv VARCHAR(50),
    gender VARCHAR(10),
    function VARCHAR(50),
    country_code CHAR(3),
    country VARCHAR(100),
    country_full VARCHAR(255),
    nationality VARCHAR(100),
    nationality_full VARCHAR(255),
    nationality_code CHAR(3),
    height DECIMAL(5, 2),
    weight DECIMAL(5, 2),
    disciplines TEXT,
    events TEXT,
    birth_date DATE
);

-- Insertar datos en la tabla countries
INSERT INTO countries (country_code, country, country_full)
VALUES
    ('MEX', 'Mexico', 'Mexico'),
    ('IRI', 'IR Iran', 'Islamic Republic of Iran'),
    ('ISV', 'Virgin Islands, US', 'Virgin Islands, US'),
    ('ROU', 'Romania', 'Romania'),
    ('FRA', 'France', 'France');

-- Insertar datos en la tabla countries
INSERT INTO countries (country_code, country, country_full)
VALUES
    ('PHI', 'Philippines', 'Philippines'),
    ('SLO', 'Slovenia', 'Slovenia'),
    ('THA', 'Thailand', 'Thailand'),
    ('BUL', 'Bulgaria', 'Bulgaria'),
    ('CYP', 'Cyprus', 'Cyprus'),
    ('EGY', 'Egypt', 'Egypt'),
    ('UZB', 'Uzbekistan', 'Uzbekistan'),
    ('HUN', 'Hungary', 'Hungary'),
    ('GER', 'Germany', 'Germany')
ON CONFLICT (country_code) DO NOTHING;  -- Prevent duplicates

-- Insertar datos en la tabla athletes
INSERT INTO athletes (code, name, name_short, name_tv, height, weight, birth_date, country_code, function)
VALUES
    ('1535420', 'VALENCIA Alejandra', 'VALENCIA A', 'Alejandra VALENCIA', 0, 0.0, '1994-10-17', 'MEX', 'Athlete'),
    ('1535429', 'RUIZ Angela', 'RUIZ A', 'Angela RUIZ', 0, 0.0, '2006-07-28', 'MEX', 'Athlete'),
    ('1535430', 'GRANDE Matias', 'GRANDE M', 'Matias GRANDE', 0, 0.0, '2004-04-26', 'MEX', 'Athlete'),
    ('1536460', 'ROJAS Carlos', 'ROJAS C', 'Carlos ROJAS', 0, 0.0, '2000-01-14', 'MEX', 'Athlete'),
    ('1536467', 'MARTINEZ WING Bruno', 'MARTINEZ WING B', 'Bruno MARTINEZ WING', 0, 0.0, '1998-03-08', 'MEX', 'Athlete'),
    ('1536479', 'VAZQUEZ Ana', 'VAZQUEZ A', 'Ana VAZQUEZ', 0, 0.0, '2000-10-05', 'MEX', 'Athlete'),
    ('1536632', 'FALLAH Mobina', 'FALLAH M', 'Mobina FALLAH', 0, 0.0, '1999-08-13', 'IRI', 'Athlete'),
    ('1537163', 'D''AMOUR Nicholas', 'D''AMOUR N', 'Nicholas D''AMOUR', 0, 0.0, '2001-09-04', 'ISV', 'Athlete'),
    ('1538449', 'AMAISTROAIE Madalina', 'AMAISTROAIE M', 'Madalina AMAISTROAIE', 0, 0.0, '2002-12-09', 'ROU', 'Athlete'),
    ('1541265', 'BARBELIN Lisa', 'BARBELIN L', 'Lisa BARBELIN', 0, 0.0, '2000-04-10', 'FRA', 'Athlete'),
    ('1541266', 'CORDEAU Amelie', 'CORDEAU A', 'Amelie CORDEAU', 0, 0.0, '2005-10-01', 'FRA', 'Athlete'),
    ('1541268', 'LOPEZ Caroline', 'LOPEZ C', 'Caroline LOPEZ', 0, 0.0, '2004-01-09', 'FRA', 'Athlete'),
    ('1541270', 'ADDIS Baptiste', 'ADDIS B', 'Baptiste ADDIS', 0, 0.0, '2006-12-07', 'FRA', 'Athlete'),
    ('1541272', 'CHIRAULT Thomas', 'CHIRAULT T', 'Thomas CHIRAULT', 0, 0.0, '1997-09-15', 'FRA', 'Athlete'),
    ('1541275', 'VALLADONT Jean-Charles', 'VALLADONT JC', 'Jean-Charles VALLADONT', 0, 0.0, '1989-03-20', 'FRA', 'Athlete');

-- Insertar datos en la tabla athletes
INSERT INTO athletes (code, name, name_short, name_tv, height, weight, birth_date, country_code, function)
VALUES
    ('1978663', 'PAGDANGANAN Bianca', 'PAGDANGANAN B', 'Bianca PAGDANGANAN', 162, 0.0, '1997-10-28', 'PHI', 'Athlete'),
    ('1980827', 'BELAC Ana', 'BELAC A', 'Ana BELAC', 164, 0.0, '1997-01-28', 'SLO', 'Athlete'),
    ('1981485', 'BABNIK Pia', 'BABNIK P', 'Pia BABNIK', 179, 0.0, '2004-01-02', 'SLO', 'Athlete'),
    ('2500123', 'APHIBARNRAT Kiradech', 'APHIBARNRAT K', 'Kiradech APHIBARNRAT', 172, 0.0, '1989-07-23', 'THA', 'Athlete'),
    ('3054982', 'ARDINA Dottie', 'ARDINA D', 'Dottie ARDINA', 157, 0.0, '1993-12-02', 'PHI', 'Athlete'),
    ('1535358', 'FLORES Sofia', 'FLORES S', 'Sofia FLORES', 0, 0.0, '2004-12-20', 'MEX', 'Athlete'),
    ('1535359', 'SALAZAR Kimberly', 'SALAZAR K', 'Kimberly SALAZAR', 0, 0.0, '2004-04-24', 'MEX', 'Athlete'),
    ('1535360', 'TEJEDA Adirem', 'TEJEDA A', 'Adirem TEJEDA', 0, 0.0, '2002-06-21', 'MEX', 'Athlete'),
    ('1535361', 'ALCOCER Dalia', 'ALCOCER D', 'Dalia ALCOCER', 0, 0.0, '2004-01-02', 'MEX', 'Athlete'),
    ('1535362', 'GUTIERREZ Julia', 'GUTIERREZ J', 'Julia GUTIERREZ', 0, 0.0, '2007-09-13', 'MEX', 'Athlete'),
    ('1540832', 'DRAGAN Annaliese', 'DRAGAN A', 'Annaliese DRAGAN', 0, 0.0, '2005-09-15', 'ROU', 'Athlete'),
    ('1548933', 'NIKOLOVA Stiliana', 'NIKOLOVA S', 'Stiliana NIKOLOVA', 0, 0.0, '2005-08-22', 'BUL', 'Athlete'),
    ('1548948', 'KALEYN Boryana', 'KALEYN B', 'Boryana KALEYN', 0, 0.0, '2000-08-23', 'BUL', 'Athlete'),
    ('1548976', 'IVANOVA Sofia', 'IVANOVA S', 'Sofia IVANOVA', 0, 0.0, '2005-09-15', 'BUL', 'Athlete'),
    ('1548985', 'PETROVA Kamelia', 'PETROVA K', 'Kamelia PETROVA', 0, 0.0, '2006-05-01', 'BUL', 'Athlete'),
    ('1548999', 'STOYANOV Rachel', 'STOYANOV R', 'Rachel STOYANOV', 0, 0.0, '2003-03-14', 'BUL', 'Athlete'),
    ('1549016', 'MINEVSKA Magdalina', 'MINEVSKA M', 'Magdalina MINEVSKA', 0, 0.0, '2005-12-03', 'BUL', 'Athlete'),
    ('1549023', 'VASILEVA Margarita', 'VASILEVA M', 'Margarita VASILEVA', 0, 0.0, '2005-05-30', 'BUL', 'Athlete'),
    ('1555070', 'TUGOLUKOVA Vera', 'TUGOLUKOVA V', 'Vera TUGOLUKOVA', 0, 0.0, '2008-09-16', 'CYP', 'Athlete'),
    ('1562222', 'HUSSEIN Farida', 'HUSSEIN F', 'Farida HUSSEIN', 0, 0.0, '2006-02-07', 'EGY', 'Athlete'),
    ('1562596', 'ELDEEB Johara', 'ELDEEB J', 'Johara ELDEEB', 0, 0.0, '2007-05-24', 'EGY', 'Athlete'),
    ('1562782', 'BEHAIRY Lamar', 'BEHAIRY L', 'Lamar BEHAIRY', 0, 0.0, '2007-08-01', 'EGY', 'Athlete'),
    ('1880542', 'IKROMOVA Takhmina', 'IKROMOVA T', 'Takhmina IKROMOVA', 0, 0.0, '2004-08-06', 'UZB', 'Athlete'),
    ('1880548', 'MAMEDOVA Amaliya', 'MAMEDOVA A', 'Amaliya MAMEDOVA', 0, 0.0, '2008-08-29', 'UZB', 'Athlete'),
    ('1880549', 'SADYKOVA Irodakhon', 'SADYKOVA I', 'Irodakhon SADYKOVA', 0, 0.0, '2007-09-05', 'UZB', 'Athlete'),
    ('1880551', 'IBRAGIMOVA Shakhzoda', 'IBRAGIMOVA S', 'Shakhzoda IBRAGIMOVA', 0, 0.0, '2002-11-24', 'UZB', 'Athlete'),
    ('1880553', 'ATALYANTS Evelina', 'ATALYANTS E', 'Evelina ATALYANTS', 0, 0.0, '2007-07-01', 'UZB', 'Athlete'),
    ('1880558', 'ISKHOKZODA Mumtozabonu', 'ISKHOKZODA M', 'Mumtozabonu ISKHOKZODA', 0, 0.0, '2005-12-31', 'UZB', 'Athlete'),
    ('1891438', 'PIGNICZKI Fanni', 'PIGNICZKI F', 'Fanni PIGNICZKI', 0, 0.0, '2000-01-23', 'HUN', 'Athlete'),
    ('1896203', 'KOLOSOV Margarita', 'KOLOSOV M', 'Margarita KOLOSOV', 0, 0.0, '2004-03-11', 'GER', 'Athlete');

-- Insertar datos en la tabla disciplines

INSERT INTO disciplines (discipline_name)
VALUES
    ('Archery');

-- Insertar datos en la tabla disciplines
INSERT INTO disciplines (discipline_name)
VALUES
    ('Golf'),
    ('Rhythmic Gymnastics');

-- Modificar la tabla EVENTS para agregar una columna discipline_code como clave foránea
ALTER TABLE events
ADD COLUMN discipline_code INT,
ADD CONSTRAINT fk_discipline_code FOREIGN KEY (discipline_code) REFERENCES disciplines(discipline_code);

-- Insertar eventos para Archery
INSERT INTO events (event_name, discipline_code)
SELECT 'Women''s Individual', discipline_code FROM disciplines WHERE discipline_name = 'Archery'
UNION ALL
SELECT 'Women''s Team', discipline_code FROM disciplines WHERE discipline_name = 'Archery'
UNION ALL
SELECT 'Mixed Team', discipline_code FROM disciplines WHERE discipline_name = 'Archery'
UNION ALL
SELECT 'Men''s Individual', discipline_code FROM disciplines WHERE discipline_name = 'Archery'
UNION ALL
SELECT 'Men''s Team', discipline_code FROM disciplines WHERE discipline_name = 'Archery';

-- Insertar eventos para Golf
INSERT INTO events (event_name, discipline_code)
SELECT 'Women''s Individual Stroke Play', discipline_code FROM disciplines WHERE discipline_name = 'Golf'
UNION ALL
SELECT 'Men''s Individual Stroke Play', discipline_code FROM disciplines WHERE discipline_name = 'Golf';

-- Insertar eventos para Rhythmic Gymnastics
INSERT INTO events (event_name, discipline_code)
SELECT 'Group All-Around', discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics'
UNION ALL
SELECT 'Individual All-Around', discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics';


-- Insertar relaciones atleta-disciplina
INSERT INTO athletesxdisciplines (athlete_code, discipline_code)
SELECT a.code, d.discipline_code
FROM athletes a
JOIN disciplines d ON
    (d.discipline_name = 'Archery' AND a.code IN ('1535420', '1535429', '1535430', '1536460', '1536467', '1536479', '1536632', '1537163', '1538449', '1541265', '1541266', '1541268', '1541270', '1541272', '1541275'))
    OR (d.discipline_name = 'Golf' AND a.code IN ('1978663', '1980827', '1981485', '2500123', '3054982'))
    OR (d.discipline_name = 'Rhythmic Gymnastics' AND a.code IN ('1535358', '1535359', '1535360', '1535361', '1535362', '1540832', '1548933', '1548948', '1548976', '1548985', '1548999', '1549016', '1549023', '1555070', '1562222', '1562596', '1562782', '1880542', '1880548', '1880549', '1880551', '1880553', '1880558', '1891438', '1896203'));

-- Insertar relaciones atleta-evento para eventos de Archery
INSERT INTO athletesxevents (athlete_code, event_code)
SELECT '1535420', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1535420', e.event_code FROM events e WHERE e.event_name = 'Women''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1535420', e.event_code FROM events e WHERE e.event_name = 'Mixed Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1535429', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1535429', e.event_code FROM events e WHERE e.event_name = 'Women''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1535430', e.event_code FROM events e WHERE e.event_name = 'Men''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1535430', e.event_code FROM events e WHERE e.event_name = 'Men''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1535430', e.event_code FROM events e WHERE e.event_name = 'Mixed Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1536460', e.event_code FROM events e WHERE e.event_name = 'Men''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1536460', e.event_code FROM events e WHERE e.event_name = 'Men''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1536467', e.event_code FROM events e WHERE e.event_name = 'Men''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1536467', e.event_code FROM events e WHERE e.event_name = 'Men''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1536479', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1536479', e.event_code FROM events e WHERE e.event_name = 'Women''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1536632', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1537163', e.event_code FROM events e WHERE e.event_name = 'Men''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1538449', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541265', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541265', e.event_code FROM events e WHERE e.event_name = 'Women''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541265', e.event_code FROM events e WHERE e.event_name = 'Mixed Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541266', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541266', e.event_code FROM events e WHERE e.event_name = 'Women''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541268', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541268', e.event_code FROM events e WHERE e.event_name = 'Women''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541270', e.event_code FROM events e WHERE e.event_name = 'Men''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541270', e.event_code FROM events e WHERE e.event_name = 'Men''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541270', e.event_code FROM events e WHERE e.event_name = 'Mixed Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541272', e.event_code FROM events e WHERE e.event_name = 'Men''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541272', e.event_code FROM events e WHERE e.event_name = 'Men''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541275', e.event_code FROM events e WHERE e.event_name = 'Men''s Individual' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery')
UNION ALL
SELECT '1541275', e.event_code FROM events e WHERE e.event_name = 'Men''s Team' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Archery');

-- Insertar relaciones atleta-evento para eventos de Golf
INSERT INTO athletesxevents (athlete_code, event_code)
SELECT '1978663', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual Stroke Play' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Golf')
UNION ALL
SELECT '1980827', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual Stroke Play' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Golf')
UNION ALL
SELECT '1981485', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual Stroke Play' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Golf')
UNION ALL
SELECT '3054982', e.event_code FROM events e WHERE e.event_name = 'Women''s Individual Stroke Play' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Golf')
UNION ALL
SELECT '2500123', e.event_code FROM events e WHERE e.event_name = 'Men''s Individual Stroke Play' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Golf');


-- Insertar relaciones atleta-evento para eventos de Rhythmic Gymnastics
INSERT INTO athletesxevents (athlete_code, event_code)
SELECT '1535358', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1535359', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1535360', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1535361', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics');

-- Insertar relaciones atleta-evento para eventos de Rhythmic Gymnastics (continuación)
INSERT INTO athletesxevents (athlete_code, event_code)
SELECT '1535362', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1540832', e.event_code FROM events e WHERE e.event_name = 'Individual All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1548933', e.event_code FROM events e WHERE e.event_name = 'Individual All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1548948', e.event_code FROM events e WHERE e.event_name = 'Individual All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1548976', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1548985', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1548999', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1549016', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1549023', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1555070', e.event_code FROM events e WHERE e.event_name = 'Individual All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1562222', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1562596', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1562782', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1880542', e.event_code FROM events e WHERE e.event_name = 'Individual All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1880548', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1880549', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1880551', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1880553', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1880558', e.event_code FROM events e WHERE e.event_name = 'Group All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1891438', e.event_code FROM events e WHERE e.event_name = 'Individual All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics')
UNION ALL
SELECT '1896203', e.event_code FROM events e WHERE e.event_name = 'Individual All-Around' AND e.discipline_code = (SELECT discipline_code FROM disciplines WHERE discipline_name = 'Rhythmic Gymnastics');

-- Agregar la columna de género a la tabla de atletas
ALTER TABLE athletes
ADD COLUMN gender VARCHAR(10);

-- Actualizar la tabla de atletas con datos de género
UPDATE athletes SET gender = 'Female' WHERE code IN
('1535420', '1535429', '1536479', '1536632', '1538449',
 '1541265', '1541266', '1541268', '1535358', '1535359',
 '1535360', '1535361', '1535362', '1540832', '1548933',
 '1548948', '1548976', '1548985', '1548999', '1549016',
 '1549023', '1555070', '1562222', '1562596', '1562782',
 '1880542', '1880548', '1880549', '1880551', '1880553',
 '1880558', '1891438', '1896203', '1978663', '1980827',
 '1981485', '3054982');

UPDATE athletes SET gender = 'Male' WHERE code IN
('1535430', '1536460', '1536467', '1537163', '1541270',
 '1541272', '1541275', '2500123');



-- Consulta 1
SELECT a.name AS full_name,
       STRING_AGG(d.discipline_name, ', ') AS disciplines,
       COUNT(ad.discipline_code) AS number_of_disciplines
FROM athletes a
JOIN athletesxdisciplines ad ON a.code = ad.athlete_code
JOIN disciplines d ON ad.discipline_code = d.discipline_code
WHERE a.gender = 'Female'
GROUP BY a.name
HAVING COUNT(ad.discipline_code) > 1;



-- Actualizar atletas con sus respectivos pesos
UPDATE athletes SET weight = 65.0 WHERE code = '1535420'; -- VALENCIA Alejandra
UPDATE athletes SET weight = 58.0 WHERE code = '1535429'; -- RUIZ Angela
UPDATE athletes SET weight = 74.0 WHERE code = '1535430'; -- GRANDE Matias
UPDATE athletes SET weight = 80.0 WHERE code = '1536460'; -- ROJAS Carlos
UPDATE athletes SET weight = 77.0 WHERE code = '1536467'; -- MARTINEZ WING Bruno
UPDATE athletes SET weight = 60.0 WHERE code = '1536479'; -- VAZQUEZ Ana
UPDATE athletes SET weight = 63.0 WHERE code = '1536632'; -- FALLAH Mobina
UPDATE athletes SET weight = 69.0 WHERE code = '1537163'; -- D'AMOUR Nicholas
UPDATE athletes SET weight = 56.0 WHERE code = '1538449'; -- AMAISTROAIE Madalina
UPDATE athletes SET weight = 61.0 WHERE code = '1541265'; -- BARBELIN Lisa
UPDATE athletes SET weight = 59.0 WHERE code = '1541266'; -- CORDEAU Amelie
UPDATE athletes SET weight = 57.0 WHERE code = '1541268'; -- LOPEZ Caroline
UPDATE athletes SET weight = 76.0 WHERE code = '1541270'; -- ADDIS Baptiste
UPDATE athletes SET weight = 78.0 WHERE code = '1541272'; -- CHIRAULT Thomas
UPDATE athletes SET weight = 82.0 WHERE code = '1541275'; -- VALLADONT Jean-Charles
UPDATE athletes SET weight = 64.0 WHERE code = '1978663'; -- PAGDANGANAN Bianca
UPDATE athletes SET weight = 68.0 WHERE code = '1980827'; -- BELAC Ana
UPDATE athletes SET weight = 70.0 WHERE code = '1981485'; -- BABNIK Pia
UPDATE athletes SET weight = 85.0 WHERE code = '2500123'; -- APHIBARNRAT Kiradech
UPDATE athletes SET weight = 58.0 WHERE code = '3054982'; -- ARDINA Dottie
UPDATE athletes SET weight = 50.0 WHERE code = '1535358'; -- FLORES Sofia
UPDATE athletes SET weight = 52.0 WHERE code = '1535359'; -- SALAZAR Kimberly
UPDATE athletes SET weight = 53.0 WHERE code = '1535360'; -- TEJEDA Adirem
UPDATE athletes SET weight = 55.0 WHERE code = '1535361'; -- ALCOCER Dalia
UPDATE athletes SET weight = 48.0 WHERE code = '1535362'; -- GUTIERREZ Julia
UPDATE athletes SET weight = 50.0 WHERE code = '1540832'; -- DRAGAN Annaliese
UPDATE athletes SET weight = 55.0 WHERE code = '1548933'; -- NIKOLOVA Stiliana
UPDATE athletes SET weight = 57.0 WHERE code = '1548948'; -- KALEYN Boryana
UPDATE athletes SET weight = 60.0 WHERE code = '1548976'; -- IVANOVA Sofia
UPDATE athletes SET weight = 58.0 WHERE code = '1548985'; -- PETROVA Kamelia
UPDATE athletes SET weight = 53.0 WHERE code = '1548999'; -- STOYANOV Rachel
UPDATE athletes SET weight = 49.0 WHERE code = '1549016'; -- MINEVSKA Magdalina
UPDATE athletes SET weight = 47.0 WHERE code = '1549023'; -- VASILEVA Margarita
UPDATE athletes SET weight = 52.0 WHERE code = '1555070'; -- TUGOLUKOVA Vera
UPDATE athletes SET weight = 50.0 WHERE code = '1562222'; -- HUSSEIN Farida
UPDATE athletes SET weight = 54.0 WHERE code = '1562596'; -- ELDEEB Johara
UPDATE athletes SET weight = 56.0 WHERE code = '1562782'; -- BEHAIRY Lamar
UPDATE athletes SET weight = 58.0 WHERE code = '1880542'; -- IKROMOVA Takhmina
UPDATE athletes SET weight = 57.0 WHERE code = '1880548'; -- MAMEDOVA Amaliya
UPDATE athletes SET weight = 59.0 WHERE code = '1880549'; -- SADYKOVA Irodakhon
UPDATE athletes SET weight = 61.0 WHERE code = '1880551'; -- IBRAGIMOVA Shakhzoda
UPDATE athletes SET weight = 62.0 WHERE code = '1880553'; -- ATALYANTS Evelina
UPDATE athletes SET weight = 63.0 WHERE code = '1880558'; -- ISKHOKZODA Mumtozabonu
UPDATE athletes SET weight = 60.0 WHERE code = '1891438'; -- PIGNICZKI Fanni
UPDATE athletes SET weight = 58.0 WHERE code = '1896203'; -- KOLOSOV Margarita


-- Consulta 2
SELECT a.name AS full_name,
       a.country_code AS nationality
FROM athletes a
WHERE a.birth_date > '2000-01-01'
AND a.weight > (SELECT AVG(weight) FROM athletes);


-- Consulta 3
SELECT c.country_full,
       COUNT(a.code) AS number_of_athletes
FROM athletes a
JOIN countries c ON a.country_code = c.country_code
GROUP BY c.country_full
HAVING COUNT(a.code) > 5;


-- Consulta 4
WITH extremes AS (
  SELECT MIN(birth_date) AS oldest, MAX(birth_date) AS youngest
  FROM athletes
)
SELECT a.name AS full_name,
       a.birth_date,
       a.country_code
FROM athletes a
JOIN extremes e ON a.birth_date = e.oldest OR a.birth_date = e.youngest;

-- Consulta 5
CREATE TEMP TABLE temp_athlete_events AS
SELECT a.code AS athlete_code,
       a.name AS full_name,
       COUNT(ae.event_code) AS total_events
FROM athletes a
JOIN athletesxevents ae ON a.code = ae.athlete_code
GROUP BY a.code, a.name
HAVING COUNT(ae.event_code) > 3;


SELECT t.full_name,
       e.event_name,
       t.total_events
FROM temp_athlete_events t
JOIN athletesxevents ae ON t.athlete_code = ae.athlete_code
JOIN events e ON ae.event_code = e.event_code;


-- Consulta 6
CREATE VIEW athlete_event_count AS
SELECT a.code,
       a.name AS full_name,
       COUNT(ae.event_code) AS event_count
FROM athletes a
JOIN athletesxevents ae ON a.code = ae.athlete_code
GROUP BY a.code, a.name;


SELECT full_name, event_count
FROM athlete_event_count
WHERE event_count = 2;


-- Actualizar atletas con sus respectivas alturas
UPDATE athletes SET height = 172.0 WHERE code = '1535420'; -- VALENCIA Alejandra
UPDATE athletes SET height = 165.0 WHERE code = '1535429'; -- RUIZ Angela
UPDATE athletes SET height = 180.0 WHERE code = '1535430'; -- GRANDE Matias
UPDATE athletes SET height = 185.0 WHERE code = '1536460'; -- ROJAS Carlos
UPDATE athletes SET height = 178.0 WHERE code = '1536467'; -- MARTINEZ WING Bruno
UPDATE athletes SET height = 170.0 WHERE code = '1536479'; -- VAZQUEZ Ana
UPDATE athletes SET height = 168.0 WHERE code = '1536632'; -- FALLAH Mobina
UPDATE athletes SET height = 175.0 WHERE code = '1537163'; -- D'AMOUR Nicholas
UPDATE athletes SET height = 163.0 WHERE code = '1538449'; -- AMAISTROAIE Madalina
UPDATE athletes SET height = 166.0 WHERE code = '1541265'; -- BARBELIN Lisa
UPDATE athletes SET height = 164.0 WHERE code = '1541266'; -- CORDEAU Amelie
UPDATE athletes SET height = 162.0 WHERE code = '1541268'; -- LOPEZ Caroline
UPDATE athletes SET height = 183.0 WHERE code = '1541270'; -- ADDIS Baptiste
UPDATE athletes SET height = 186.0 WHERE code = '1541272'; -- CHIRAULT Thomas
UPDATE athletes SET height = 190.0 WHERE code = '1541275'; -- VALLADONT Jean-Charles
UPDATE athletes SET height = 170.0 WHERE code = '1978663'; -- PAGDANGANAN Bianca
UPDATE athletes SET height = 174.0 WHERE code = '1980827'; -- BELAC Ana
UPDATE athletes SET height = 179.0 WHERE code = '1981485'; -- BABNIK Pia
UPDATE athletes SET height = 172.0 WHERE code = '2500123'; -- APHIBARNRAT Kiradech
UPDATE athletes SET height = 157.0 WHERE code = '3054982'; -- ARDINA Dottie
UPDATE athletes SET height = 160.0 WHERE code = '1535358'; -- FLORES Sofia
UPDATE athletes SET height = 159.0 WHERE code = '1535359'; -- SALAZAR Kimberly
UPDATE athletes SET height = 158.0 WHERE code = '1535360'; -- TEJEDA Adirem
UPDATE athletes SET height = 160.0 WHERE code = '1535361'; -- ALCOCER Dalia
UPDATE athletes SET height = 156.0 WHERE code = '1535362'; -- GUTIERREZ Julia
UPDATE athletes SET height = 165.0 WHERE code = '1540832'; -- DRAGAN Annaliese
UPDATE athletes SET height = 165.0 WHERE code = '1548933'; -- NIKOLOVA Stiliana
UPDATE athletes SET height = 167.0 WHERE code = '1548948'; -- KALEYN Boryana
UPDATE athletes SET height = 162.0 WHERE code = '1548976'; -- IVANOVA Sofia
UPDATE athletes SET height = 163.0 WHERE code = '1548985'; -- PETROVA Kamelia
UPDATE athletes SET height = 164.0 WHERE code = '1548999'; -- STOYANOV Rachel
UPDATE athletes SET height = 159.0 WHERE code = '1549016'; -- MINEVSKA Magdalina
UPDATE athletes SET height = 157.0 WHERE code = '1549023'; -- VASILEVA Margarita
UPDATE athletes SET height = 161.0 WHERE code = '1555070'; -- TUGOLUKOVA Vera
UPDATE athletes SET height = 160.0 WHERE code = '1562222'; -- HUSSEIN Farida
UPDATE athletes SET height = 163.0 WHERE code = '1562596'; -- ELDEEB Johara
UPDATE athletes SET height = 164.0 WHERE code = '1562782'; -- BEHAIRY Lamar
UPDATE athletes SET height = 162.0 WHERE code = '1880542'; -- IKROMOVA Takhmina
UPDATE athletes SET height = 163.0 WHERE code = '1880548'; -- MAMEDOVA Amaliya
UPDATE athletes SET height = 165.0 WHERE code = '1880549'; -- SADYKOVA Irodakhon
UPDATE athletes SET height = 167.0 WHERE code = '1880551'; -- IBRAGIMOVA Shakhzoda
UPDATE athletes SET height = 166.0 WHERE code = '1880553'; -- ATALYANTS Evelina
UPDATE athletes SET height = 168.0 WHERE code = '1880558'; -- ISKHOKZODA Mumtozabonu
UPDATE athletes SET height = 162.0 WHERE code = '1891438'; -- PIGNICZKI Fanni
UPDATE athletes SET height = 164.0 WHERE code = '1896203'; -- KOLOSOV Margarita


-- Consulta 7
CREATE TEMP TABLE temp_avg_height_weight AS
SELECT country_code AS nationality,
       AVG(height) AS avg_height,
       AVG(weight) AS avg_weight
FROM athletes
GROUP BY country_code;


SELECT nationality, avg_height, avg_weight
FROM temp_avg_height_weight
WHERE avg_height > 180 AND avg_weight < 75;



-- Consulta 8
SELECT a.name AS athlete_name,
       d.discipline_name AS discipline,
       STRING_AGG(e.event_name, ', ') AS mismatched_events
FROM athletes a
JOIN athletesxdisciplines ad ON a.code = ad.athlete_code
JOIN disciplines d ON ad.discipline_code = d.discipline_code
JOIN athletesxevents ae ON a.code = ae.athlete_code
JOIN events e ON ae.event_code = e.event_code
WHERE e.discipline_code <> d.discipline_code
GROUP BY a.name, d.discipline_name;




--Punto 2

-- creando la tabla de categorias
CREATE TABLE category (
    id_category SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- creando la tabla de amenidades
CREATE TABLE amenity (
    id_amenity SERIAL PRIMARY KEY,
    description VARCHAR(255) NOT NULL
);

-- creando la tabla de fuentes
CREATE TABLE source (
    id_source SERIAL PRIMARY KEY,
    source_name VARCHAR(255) NOT NULL
);

-- creando la tabla de apartamentos
CREATE TABLE apartment (
    id_apartment SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(2),
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    bedrooms INT,
    square_feet INT,
    pets_allowed VARCHAR(255),
    source_id INT REFERENCES source(id_source),
    category_id INT REFERENCES category(id_category),
    timestamp_posted TIMESTAMP
);

-- creando la tabla de precios
CREATE TABLE price (
    id_price SERIAL PRIMARY KEY,
    apartment_id INT REFERENCES apartment(id_apartment),
    price DECIMAL(10, 2),
    price_type VARCHAR(50),
    currency VARCHAR(10)
);

-- creando la tabla de apartamento_amenidad
CREATE TABLE apartment_amenity (
    apartment_id INT REFERENCES apartment(id_apartment),
    amenity_id INT REFERENCES amenity(id_amenity),
    PRIMARY KEY (apartment_id, amenity_id)
);

-- Insertando datos en la tabla de categorias
INSERT INTO category (category_name) VALUES
('housing/rent/apartment'),
('housing/rent/studio');

-- Insertando datos en la tabla de fuentes
INSERT INTO source (source_name) VALUES
('RentHop'),
('RentLingo'),
('RentDig');

-- Insertando datos en la tabla de apartamentos
INSERT INTO apartment (title, description, address, city, state, latitude, longitude, bedrooms, square_feet, pets_allowed, source_id, category_id, timestamp_posted)
VALUES
('Studio apartment 234 NE, Upland Terrace', 'Studio apartment in Upland Terrace', '234 NE Upland Terrace', 'Washington', 'DC', 38.900, -76.996, 1, 450, 'None', 1, 1, '2024-01-05 12:00:00'),
('One BR 101 Chapel Dr', 'Spacious one-bedroom apartment in Tallahassee', '101 Chapel Dr', 'Tallahassee', 'FL', 30.4401, -84.2807, 1, 650, 'Cats', 2, 2, '2024-01-06 14:00:00');

-- Insertando datos en la tabla de precios
INSERT INTO price (apartment_id, price, price_type, currency)
VALUES
(1, 2700, 'Monthly', 'USD'),
(2, 2250, 'Monthly', 'USD');

-- Insertando datos en la tabla de amenidades
INSERT INTO amenity (description) VALUES
('Dishwasher'),
('Pool'),
('Gym');

-- Insertando datos en la tabla de apartamento_amenidad
INSERT INTO apartment_amenity (apartment_id, amenity_id)
VALUES
(1, 1),
(1, 2),
(2, 1);

SELECT title, price, bedrooms
FROM apartment a
JOIN price p ON a.id_apartment = p.apartment_id
WHERE city = 'Washington';

SELECT state, COUNT(*) as listing_count
FROM apartment
GROUP BY state
HAVING COUNT(*) > 100;

SELECT city, AVG(p.price) as avg_price, COUNT(a.id_apartment) as num_apartments
FROM apartment a
JOIN price p ON a.id_apartment = p.apartment_id
WHERE a.bedrooms >= 2
GROUP BY city
HAVING COUNT(a.id_apartment) >= 2;

SELECT title, price, address
FROM apartment a
JOIN price p ON a.id_apartment = p.apartment_id
WHERE LOWER(a.title) LIKE '%luxury%' OR LOWER(a.description) LIKE '%luxury%';

--creando la vista
CREATE VIEW apartment_price_per_sqft AS
SELECT a.title, a.square_feet, p.price, (p.price / a.square_feet) as price_per_sqft
FROM apartment a
JOIN price p ON a.id_apartment = p.apartment_id;

--consulta para obtener los apartamentos con precio por pie cuadrado mayor al precio mediano
WITH median_value AS (
    SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price_per_sqft) AS median_price
    FROM apartment_price_per_sqft
)
SELECT title, price_per_sqft
FROM apartment_price_per_sqft
WHERE price_per_sqft > (SELECT median_price FROM median_value);

--crear la tabla temporal
CREATE TEMP TABLE top_10_expensive_apartments AS
SELECT state, price
FROM apartment a
JOIN price p ON a.id_apartment = p.apartment_id
ORDER BY p.price DESC
LIMIT 10;

--consulta para obtener el promedio de los precios de los 10 apartamentos más caros por estado
SELECT state, AVG(price) as avg_top_price
FROM top_10_expensive_apartments
GROUP BY state;

SELECT a.id_apartment, a.title,
    CASE
        WHEN a.description ~ '(\d+)\s*bedrooms?' AND a.bedrooms::text <> regexp_replace(a.description, '[^\d]', '', 'g')
        THEN 'Mismatch between listed and described bedrooms'
        ELSE 'No inconsistency'
    END as inconsistency
FROM apartment a
WHERE a.description ~ '(\d+)\s*bedrooms?';






