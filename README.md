# saadbinasadaarbi

Personal portfolio website showcasing DevOps & Release Engineering experience, projects, and skills.

## Live Site

[https://saad-portfolio-mauve.vercel.app/](https://saad-portfolio-mauve.vercel.app/)

## Tech Stack

- HTML5
- CSS3
- Vanilla JavaScript

## Deployment (Vercel)

The site deploys to Vercel via GitHub Actions on every push to `main`.

### Required GitHub Secrets

Add these in **Settings → Secrets and variables → Actions**:

| Secret | How to get it |
|--------|---------------|
| `VERCEL_TOKEN` | [Vercel Dashboard](https://vercel.com/account/tokens) → Create Token |
| `VERCEL_ORG_ID` | Run `vercel link` locally, then check `.vercel/project.json` |
| `VERCEL_PROJECT_ID` | Same as above in `.vercel/project.json` |

Or from an existing Vercel project: **Project Settings → General** → copy the IDs.

## Local Development

Simply open `index.html` in your browser or use a local server:

```bash
# Using Python
python -m http.server 8000

# Using Node.js (npx)
npx serve
```

Then visit `http://localhost:8000`

## Docker

Multi-stage Dockerfile for production deployment with nginx.

### Build

```bash
docker build -t saadbinasadaarbi .
```

### Run

```bash
docker run -p 8080:80 saadbinasadaarbi
```

Visit `http://localhost:8080`

### Cloudflare Tunnel

```bash
# Start the container
docker run -d -p 8080:80 --name personal-site saadbinasadaarbi

# Expose via Cloudflare Tunnel
cloudflared tunnel --url http://localhost:8080
```
