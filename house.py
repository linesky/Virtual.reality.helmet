import tkinter as tk
import math

class RotatingCarVR:
    def __init__(self, root):
        self.root = root
        self.root.title("Simulação VR: Automóvel Rotativo")
        self.root.geometry("640x480")
        self.root.configure(bg="black")

        # Canvas para desenhar a simulação VR
        self.canvas = tk.Canvas(root, width=640, height=480, bg="black", highlightthickness=0)
        self.canvas.pack()

        # Dividindo a tela em duas partes com uma linha branca
        self.canvas.create_line(320, 0, 320, 480, fill="white", width=2)

        # Define os vértices de um automóvel simples em arame
        self.vertices = [
            [-2, -1, -1],  [2, -1, -1],  [2, -1, 1],  [-2, -1, 1],  # Parte inferior do carro
            [-2, 1, -1],   [2, 1, -1],   [2, 1, 1],   [-2, 1, 1],   # Parte superior do carro
            [-1.5, 1.5, -1], [1.5, 1.5, -1], [1.5, 1.5, 1], [-1.5, 1.5, 1]  # Parte superior em cima do teto (teto do carro)
        ]

        # Define as arestas que conectam os vértices para formar o "arame" do automóvel
        self.edges = [
            (0, 1), (1, 2), (2, 3), (3, 0),  # Base do carro
            (4, 5), (5, 6), (6, 7), (7, 4),  # Topo do carro
            (0, 4), (1, 5), (2, 6), (3, 7),  # Conexões verticais entre a base e o topo
            (8, 9), (9, 10), (10, 11), (11, 8),  # Teto superior
            (4, 8), (5, 9), (6, 10), (7, 11)   # Conexões entre o topo e o teto do carro
        ]

        # Ângulos de rotação
        self.angle_x = 0
        self.angle_y = 0

        # Inicia a rotação
        self.update_car()

    def project_point(self, point, width, height, scale=100):
        """Projeção 3D para 2D"""
        x, y, z = point
        factor = scale / (z + 5)  # Projeção em perspectiva simples
        x_proj = int(x * factor + width / 2)
        y_proj = int(y * factor + height / 2)
        return x_proj, y_proj

    def rotate(self, x, y, z, angle_x, angle_y):
        """Rotaciona um ponto 3D em torno dos eixos X e Y"""
        # Rotação em torno do eixo X
        cos_x, sin_x = math.cos(angle_x), math.sin(angle_x)
        y1, z1 = y * cos_x - z * sin_x, y * sin_x + z * cos_x

        # Rotação em torno do eixo Y
        cos_y, sin_y = math.cos(angle_y), math.sin(angle_y)
        x2, z2 = x * cos_y + z1 * sin_y, -x * sin_y + z1 * cos_y

        return x2, y1, z2

    def draw_car(self):
        self.canvas.delete("car")

        # Rotaciona e projeta os vértices
        rotated_vertices = []
        for vertex in self.vertices:
            x, y, z = self.rotate(*vertex, self.angle_x, self.angle_y)
            rotated_vertices.append((x, y, z))

        # Desenha o carro no lado esquerdo
        for edge in self.edges:
            p1 = self.project_point(rotated_vertices[edge[0]], 320, 480)
            p2 = self.project_point(rotated_vertices[edge[1]], 320, 480)
            self.canvas.create_line(p1, p2, fill="white", tags="car")

        # Desenha o carro no lado direito (com deslocamento de 320 px)
        for edge in self.edges:
            p1 = self.project_point(rotated_vertices[edge[0]], 640, 480)
            p2 = self.project_point(rotated_vertices[edge[1]], 640, 480)
            self.canvas.create_line(p1, p2, fill="white", tags="car")

    def update_car(self):
        # Atualiza os ângulos para rotacionar continuamente
        self.angle_x += 0.02
        self.angle_y += 0.01

        # Redesenha o carro
        self.draw_car()

        # Repetir a atualização a cada 50 milissegundos
        self.root.after(50, self.update_car)

if __name__ == "__main__":
    root = tk.Tk()
    app = RotatingCarVR(root)
    root.mainloop()

