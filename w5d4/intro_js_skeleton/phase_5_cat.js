const Cat = function (name, owner) {
  this.name = name;
  this.owner = owner;
};

Cat.prototype.cuteStatement = function () {
  return `${this.owner} loves ${this.name}`;
};

let cat1 = new Cat("Julius", "Jay");
let cat2 = new Cat("Avalanche", "Miles");

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());

Cat.prototype.cuteStatement = function () {
  return `Everyone loves ${this.name}`;
};

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());

cat2.meow = function () {
  return "meow";
};

console.log(cat2.meow());
// console.log(cat1.meow());
