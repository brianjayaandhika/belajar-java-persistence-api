package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Category;
import programmerzamannow.jpa.util.JpaUtil;

import java.time.LocalDateTime;
import java.util.Calendar;

public class DateTimeTest {

    @Test
    void column() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Category category = new Category();
        category.setName("Food");
        category.setDescription("Tasty Food");
        category.setCreatedAt(Calendar.getInstance());
        category.setUpdatedAt(LocalDateTime.now());


        entityManager.persist(category);
        entityTransaction.commit();

    }

    @Test
    void columnUpdate() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Category category = entityManager.find(Category.class, "2");
        category.setDescription("Tasty Delicious Food");
        category.setUpdatedAt(LocalDateTime.now());


        entityManager.merge(category);
        entityTransaction.commit();
    }
}
