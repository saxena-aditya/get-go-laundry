package com.org.testClasses;

import java.util.LinkedList;
import java.util.List;

public class PersonListContainer {

  // Important. Set this to a default List in order to avoid null pointer
  // exceptions when the list is empty
  private List<Person> personList = new LinkedList<Person>();

  public PersonListContainer() {}

  public PersonListContainer(List<Person> personList) {
    this.personList = personList;
  }

  public List<Person> getPersonList() {
    return personList;
  }

  public void setPersonList(List<Person> personList) {
    this.personList = personList;
  }
}
