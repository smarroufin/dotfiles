import { $ } from "bun"

const pageToUrl = {
  'index': '',
  'issues': '/issues',
  'pulls': '/pulls',
  'releases': '/releases',
}

function error(msg: string) {
  console.error(msg)
  process.exit(1)
}

async function main() {
  const [page, pkg] = Bun.argv.slice(2)
  let repo: string | undefined
  if (pkg) {
    repo = await getRepositoryUrlForPackage(pkg)
  } else {
    repo = await getCurrentRepositoryUrl()
  }
  if (!repo) return
  const pageUrl = pageToUrl[page] ?? ''
  await $`open ${repo}${pageUrl}`
}

async function getCurrentRepositoryUrl() {
  try {
    const repoRemote = await $`git remote get-url origin`.text()
    return repoRemote.trim().replace(/\.git$/, '')
  } catch {
    error('Repository not found')
  }
}

async function getRepositoryUrlForPackage(pkg: string) {
  try {
    const encodedName = pkg.replace('/', '%2F')
    const registryResponse = await fetch(`https://registry.npmjs.org/${encodedName}`)
    const registryBody = await registryResponse.json()
    return (registryBody.repository.url as string)
      .replace(/^git\+/, '')
      .replace(/\.git$/, '')
  } catch (e) {
    error('Repository not found')
  }
}

main()

