package students.dao;
import studentdetails.dto.Student;


import java.util.List;
import javax.persistence.*;



public class StudentDao {
	
	public Student saveStudent(Student stud) 
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Villian");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(stud);
		et.commit();
		return stud;
		
	}
	public Student findbyId(int id) 
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Villian");
		EntityManager em = emf.createEntityManager();
		
		return em.find(Student.class, id);
	}
	public int updateStudent(Student stud) 
	{ 
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Villian");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
			et.begin();
			em.merge(stud);
			et.commit();
			return 1;
		
		

		
	}
	
	public int deleteStudent(int id) 
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Villian");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.remove(em.find(Student.class, id));
		et.commit();
		return 1;
	}
	public List<Student> getAllStudent() 
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Villian");
		EntityManager em = emf.createEntityManager();
		String jpql = "select s from Student s";
		TypedQuery<Student> stud =em.createQuery(jpql, Student.class);
		List<Student> student = stud.getResultList();
		return student;
			
	}
	public Student findByName(String name) 
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Villian");
		EntityManager em = emf.createEntityManager();
		String jpql = "SELECT s FROM Student s WHERE s.name = :name";
		TypedQuery<Student> stud = em.createQuery(jpql, Student.class);
		stud.setParameter("name", name);
		Student student= stud.getSingleResult();
		if (student != null) {
			return student;
		}
		return null;
	}
	
//	public static void main(String[] args) {
//		StudentDao s = new StudentDao();
//		Student a =s.findbyId(23);
//		System.out.println(a.getId());
//		System.out.println(a.getImage());
//		
//		 
//		
//	}
	
}
