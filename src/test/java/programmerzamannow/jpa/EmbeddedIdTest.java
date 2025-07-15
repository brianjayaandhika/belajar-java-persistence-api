package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Customer;
import programmerzamannow.jpa.entity.Department;
import programmerzamannow.jpa.entity.DepartmentId;
import programmerzamannow.jpa.util.JpaUtil;

@Slf4j
public class EmbeddedIdTest {

    @Test
    void embeddedId() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Department department = new Department();

        department.setName("Resources");
        department.setId(new DepartmentId("pzn", "tech"));


        entityManager.persist(department);
        entityTransaction.commit();

    }

    @Test
    void embeddedIdFind() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        DepartmentId id = new DepartmentId("pzn", "tech");

        Department department = entityManager.find(Department.class, id);

        log.info("Department Name: " + department.getName());
        Assertions.assertEquals("Resources", department.getName());

        entityTransaction.commit();
    }
}
