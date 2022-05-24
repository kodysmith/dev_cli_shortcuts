#!/Users/ksmith/.nvm/versions/node/v14.17.5/bin/node
const [nodeversion, file, packagePath, ...args] = process.argv;
const currentdir = process.cwd();
function whoOwns (bundlePath) {
  const package = require(`${currentdir}/${bundlePath}/package.json`);
  let owners = [];
  if(package.courseraOwners) {
    owners = [...owners, JSON.stringify(package.courseraOwners, null, 4)];
  }

  if(package.contributors) {
    owners = [...owners, ...package.contributors];
  }

  return owners.join('\n');
}

function banner(label) {
  return `#################### ${label} ###################`;
}

console.log('\n\n', banner('CODE OWNERS'));

console.log(whoOwns(packagePath));
console.log('\n\n', banner('CODE OWNERS END'));

