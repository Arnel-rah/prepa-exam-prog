package org.example;

import io.github.cdimascio.dotenv.Dotenv;
import java.sql.*;

public class Main {
    public static void main(String[] args) {
        // Charger le fichier .env
        Dotenv dotenv = Dotenv.load();

        // Récupérer les variables
        String url = dotenv.get("DB_URL");
        String username = dotenv.get("DB_USER");
        String password = dotenv.get("DB_PASSWORD");

        String query = "SELECT id, username, email FROM users";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            System.out.println("Connexion réussie via .env !");
            while (rs.next()) {
                System.out.printf("ID: %d | Nom: %s%n", rs.getInt("id"), rs.getString("username"));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erreur de base de données", e);
        }
    }
}