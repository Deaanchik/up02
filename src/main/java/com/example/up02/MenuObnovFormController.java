package com.example.up02;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javax.swing.*;
import java.sql.*;

public class MenuObnovFormController {
    @FXML
    private Connection con;

    @FXML
    private Statement stmt;

    public TextField txtIdDish;
    public TextField txtNameDish;
    public TextField txtCostDish;
    public TextField txtStoplist;


    private Boolean modalResult = false;


    public void onSaveClick(ActionEvent actionEvent) {
        this.modalResult = true;
        ((Stage) ((Node) actionEvent.getSource()).getScene().getWindow()).close();
    }

    public void onCancelClick(ActionEvent actionEvent) {
        this.modalResult = false;
        ((Stage) ((Node) actionEvent.getSource()).getScene().getWindow()).close();
    }

    public Boolean getModalResult() {
        return modalResult;
    }

    public Menu getMenu() {
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kursovik", "root", "Chudnenko357");
            stmt = con.createStatement();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Unable to connect to database " + e.getMessage());
        }


        try {
            String sql;
            sql = "insert into menu(id_dish,name_dish,cost_dish,stoplist) values ("
                    + txtIdDish.getText() + ","
                    + "'" + txtNameDish.getText() + "',"
                    + "'" + txtCostDish.getText() + "',"
                    + "'" + txtStoplist.getText() + "')";

            int rs = stmt.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "информация сохранилась");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Unable to insert record " + e.getMessage());
        }

        return null;
    }
}

