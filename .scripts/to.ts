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

  const npmxUrl = `https://npmx.dev/package/${name}`
  try {
    let repoUrl: string | null = null
    const npmxGithubLinks = await getRegexMatchesFromPage(npmxUrl, /https:\/\/github.com\/[a-z0-9-_]+\/[a-z0-9-_]+/gi)
    if (npmxGithubLinks?.length) {
      repoUrl = npmxGithubLinks[0]
    } else {
      const npmjsUrl = `https://www.npmjs.com/package/${name}`
      const npmjsGithubLinks = await getRegexMatchesFromPage(npmjsUrl, /https:\/\/github.com\/[a-z0-9-_]+\/[a-z0-9-_]+/gi)
      if (npmjsGithubLinks?.length) {
        repoUrl = npmjsGithubLinks[0]
      }
    }

    if (repoUrl) {
      return await open(`${repoUrl}/releases`)
    } else {
      return await open(npmxUrl)
    }
  } catch {
    return await open(npmxUrl)
  }
}
async function getRegexMatchesFromPage(url: string, regex: RegExp) {
  try {
    const page = await fetch(url)
    const body = await page.text()
    return [...body.match(regex) ?? []]
  } catch {
    return []
  }
}

main()

