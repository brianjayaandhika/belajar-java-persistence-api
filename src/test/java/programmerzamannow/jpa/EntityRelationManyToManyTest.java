package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Brand;
import programmerzamannow.jpa.entity.Product;
import programmerzamannow.jpa.entity.User;
import programmerzamannow.jpa.util.JpaUtil;

import java.util.HashSet;

public class EntityRelationManyToManyTest {

    @Test
    void manyToManyCreate() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        User user = entityManager.find(User.class, "001");
        user.setLikes(new HashSet<>());
        user.getLikes().add(entityManager.find(Product.class, "001"));
        user.getLikes().add(entityManager.find(Product.class, "002"));

        entityManager.merge(user);

        entityTransaction.commit();
    }

    @Test
    void manyToManyFind() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        User user = entityManager.find(User.class, "001");

        Assertions.assertEquals(2, user.getLikes().size());

        for (Product product : user.getLikes()) {
            System.out.println(product.getName());
        }

        entityTransaction.commit();
    }
}
