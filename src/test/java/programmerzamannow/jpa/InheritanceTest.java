package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Employee;
import programmerzamannow.jpa.entity.Manager;
import programmerzamannow.jpa.entity.VicePresident;
import programmerzamannow.jpa.util.JpaUtil;

public class InheritanceTest {

    @Test
    void singleTableInsert() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Employee employee = new Employee();
        employee.setId("khannedy");
        employee.setName("Khannedy");
        entityManager.persist(employee);

        Manager manager1 = new Manager();
        manager1.setId("budianto");
        manager1.setName("Budianto");
        manager1.setTotalEmployee(10);
        entityManager.persist(manager1);

        VicePresident vicePresident = new VicePresident();
        vicePresident.setId("joko");
        vicePresident.setName("Joko");
        vicePresident.setTotalManager(5);
        entityManager.persist(vicePresident);


        entityTransaction.commit();
    }

    @Test
    void singleTableFind() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Employee employee = entityManager.find(Employee.class, "khannedy");
        System.out.println(employee.getName());


        Manager manager = (Manager) entityManager.find(Employee.class, "budianto");;
        System.out.println(manager.getName());


        VicePresident vp = (VicePresident) entityManager.find(Employee.class, "joko");
        System.out.println(vp.getName());

        entityTransaction.commit();
    }
}
