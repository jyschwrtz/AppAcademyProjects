const Student = function (fname, lname) {
  this.fname = fname;
  this.lname = lname;
  this.courses = [];
};

Student.prototype.name = function () {
  return `${this.fname} ${this.lname}`;
};

Student.prototype.hasConflict = function (course) {
  let conflict = false;
  this.courses.forEach(el => {
    if (el.conflictsWith(course)) {
      conflict = true;
    }
  });
  return conflict;
};

Student.prototype.enroll = function (course) {
  if (this.hasConflict(course)) {
    throw 'Impossible. U have a conflict!!!';
  } else {
    this.courses.push(course);
    course.students.push(this);
  }
};

Student.prototype.courseload = function () {
  const courseLoad = {};
  this.courses.forEach(el => {
    if (courseLoad[el.dept]) {
      courseLoad[el.dept] += el.credits;
    } else {
      courseLoad[el.dept] = el.credits;
    }
  });
  return courseLoad;
};

const Course = function (name, dept, credits, block, days) {
  this.name = name;
  this.dept = dept;
  this.credits = credits;
  this.block = block;
  this.days = days;
  this.students = [];
};

Course.prototype.addStudent = function (student) {
  student.enroll(this);
};

Course.prototype.conflictsWith = function (course) {
  let conflicts = false;
  this.days.forEach(day => {
    if (course.days.includes(day) && course.block === this.block) {
      conflicts = true;
    }
  });
  return conflicts;
};

const julius = new Student ("Julius", "Caesar");
const bio = new Course ("Bio", "Science", 4, 1, ["m", "w", "f"]);
const chem = new Course ("Chem", "Science", 4, 2, ["t", "th"]);
const art = new Course ("Art", "Art", 14, 1, ["m", "w", "f"]);
