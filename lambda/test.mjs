import { sayHello } from '../dist/hello.js';

const main = () => {
  const message = sayHello();
  console.log('sayHello returned:', message);
};

main();
