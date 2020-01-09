package example.dao;

import example.entity.Librarian;

import java.util.List;

public interface LibrarianDao {
    List<Librarian> queryLibrarianList();

    Librarian findLibrarianByName(String name);

    int changePwd(String pwd, int id);
}
