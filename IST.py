import speedtest as st
import time
import sys

def show_progress(message):
    # Function to show a dynamic loading animation
    for _ in range(10):
        sys.stdout.write(f'\r{message} [{"=" * _}{" " * (10 - _)}]')
        sys.stdout.flush()
        time.sleep(0.1)

def test_internet_speed():
    # Function to test internet speed
    print("╔════════════════════════════════════════╗")
    print("║           Testing internet speed        ║")
    print("╚════════════════════════════════════════╝")

    server = st.Speedtest()
    server.get_best_server()

    # Test Download Speed
    show_progress("Testing download speed")
    download_speed = server.download() / 1000000  # Convert bytes per second to megabits per second
    print(f"\rDownload Speed: {download_speed:.2f} Mb/s")

    # Test Upload Speed
    show_progress("Testing upload speed")
    upload_speed = server.upload() / 1000000  # Convert bytes per second to megabits per second
    print(f"\rUpload Speed: {upload_speed:.2f} Mb/s")

    # Test Ping
    ping_speed = server.results.ping
    print(f"Ping Speed: {ping_speed} ms")

if __name__ == "__main__":
    test_internet_speed()
