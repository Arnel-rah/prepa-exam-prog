-- =========================================================
-- 1️⃣ Connexion en superutilisateur (postgres)
-- (à faire dans le terminal, pas dans le fichier)
-- psql -U postgres
-- =========================================================


-- =========================================================
-- 2️⃣ Création de la base de données
-- =========================================================
CREATE DATABASE mini_football_db;


-- =========================================================
-- 3️⃣ Création de l’utilisateur applicatif
-- =========================================================
CREATE USER mini_football_db_manager
WITH PASSWORD '123456';


-- =========================================================
-- 4️⃣ Donner l’accès à la base
-- =========================================================
GRANT ALL PRIVILEGES
ON DATABASE mini_football_db
TO mini_football_db_manager;


-- =========================================================
-- 5️⃣ Se connecter à la base
-- =========================================================
\c mini_football_db


-- =========================================================
-- 6️⃣ Droits sur le schema public (PIÈGE CLASSIQUE)
-- =========================================================
GRANT USAGE, CREATE
ON SCHEMA public
TO mini_football_db_manager;


-- =========================================================
-- 7️⃣ Droits sur les tables EXISTANTES
-- =========================================================
GRANT SELECT, INSERT, UPDATE, DELETE
      ON ALL TABLES IN SCHEMA public
          TO mini_football_db_manager;


-- =========================================================
-- 8️⃣ Droits sur les SEQUENCES EXISTANTES (CRUCIAL)
-- =========================================================
GRANT USAGE, SELECT, UPDATE
             ON ALL SEQUENCES IN SCHEMA public
                 TO mini_football_db_manager;


-- =========================================================
-- 9️⃣ Droits AUTOMATIQUES pour les objets FUTURS
-- =========================================================

-- Tables futures
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE
      ON TABLES
          TO mini_football_db_manager;

-- Séquences futures
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT, UPDATE
             ON SEQUENCES
                 TO mini_football_db_manager;
