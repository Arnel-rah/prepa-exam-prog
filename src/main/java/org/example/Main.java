package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/users_story";
        String username = "postgres";
        String password = "Arnel012*/";

        String query = "SELECT id, username, email FROM users";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            System.out.println("Liste des utilisateurs :");
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("username");
                String email = rs.getString("email");

                System.out.printf("ID: %d | Nom: %s | Email: %s%n", id, name, email);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erreur fatale lors de l'accès à la base de données", e);
        }
    }
}