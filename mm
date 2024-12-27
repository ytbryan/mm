#!/usr/bin/env python3
import typer
import os
import subprocess
import glob
import time

def main(patterns: list[str] = typer.Argument(..., help="Single file or pattern for matching files.")):
    """Converts documents to markdown format using 'markitdown'. Accepts single or multiple files/patterns."""
    start_time = time.time()  # Start timing
    files = []

    for pattern in patterns:
        if os.path.isfile(pattern):
            files.append(pattern)
        else:
            files.extend(glob.glob(pattern))

    if not files:
        typer.echo("No matching files found.")
        return

    success_count = 0

    for file in files:
        try:
            # Extract the base name (without extension) and append '.md'
            base_name = os.path.splitext(file)[0]
            output_name = f"{base_name}.md"

            # Run the 'markitdown' command and save output to the generated name
            with open(output_name, "w") as output_file:
                subprocess.run(["markitdown", file], stdout=output_file, text=True, check=True)

            typer.echo(f"Conversion successful! Saved as {output_name}")
            success_count += 1
        except subprocess.CalledProcessError as e:
            typer.echo(f"Error processing {file}: {e.stderr}", err=True)
        except FileNotFoundError:
            typer.echo(f"Error: File '{file}' not found.", err=True)

    # End timing and calculate duration
    end_time = time.time()
    elapsed_time = end_time - start_time

    # Final summary
    typer.echo(f"All done! Generated {success_count} markdown files in {elapsed_time:.2f}s.")

if __name__ == "__main__":
    typer.run(main)