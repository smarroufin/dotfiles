import open from 'open'

function error(msg: string) {
  console.error(msg)
  process.exit(1)
}

async function main() {
  const command: string = Bun.argv[2]
  const args: string[] = Bun.argv.slice(3)
  switch (command) {
    case 'releases':
      return toReleases(args)
    default:
      return error(`Unknown command: ${command}`)
  }
}

async function toReleases(args: string[]) {
  const name = args[0]
  if (!name) {
    return error('package not found')
  }

  const repoUrl = await getRepositoryUrlForPackage(name)
  if (!repoUrl) {
    return error('repository not found')
  }
  return await open(`${repoUrl}/releases`)
}

async function getRepositoryUrlForPackage(pkg: string) {
  try {
    const encodedName = pkg.replace('/', '%2F')
    const registryResponse = await fetch(`https://registry.npmjs.org/${encodedName}`)
    const registryBody = await registryResponse.json()
    return registryBody.repository.url
      .replace(/^git\+/, '')
      .replace(/\.git$/, '')
  } catch (e) {
    console.error(e)
    return null
  }
}

main()

