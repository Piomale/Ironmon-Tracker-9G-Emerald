from PIL import Image
import os

def crop_transparent(image_path):
    image = Image.open(image_path)

    if image.mode != "RGBA":
        print(f"{image_path} n'a pas de transparence.")
        return

    # Convertir en mode RGBA (au cas où)
    image = image.convert("RGBA")

    # Récupérer le canal alpha
    alpha = image.split()[3]

    # Obtenir la bbox de la zone non transparente
    bbox = alpha.getbbox()

    if bbox:
        cropped_image = image.crop(bbox)
        cropped_image.save(image_path)
        print(f"Image rognée et sauvegardée : {image_path}")
    else:
        print(f"{image_path} est complètement transparent.")

def process_images():
    current_directory = os.getcwd()

    for file in os.listdir(current_directory):
        if file.lower().endswith(".png"):
            crop_transparent(file)

if __name__ == "__main__":
    process_images()

