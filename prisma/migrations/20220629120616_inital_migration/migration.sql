-- CreateEnum
CREATE TYPE "Which" AS ENUM ('client', 'admin');

-- CreateEnum
CREATE TYPE "Methods" AS ENUM ('cash', 'card');

-- CreateEnum
CREATE TYPE "Status" AS ENUM ('pending', 'accepted', 'rejected');

-- CreateTable
CREATE TABLE "User" (
    "user_id" UUID NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "role" "Which" NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "Portress" (
    "portress_id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "price" TEXT NOT NULL,

    CONSTRAINT "Portress_pkey" PRIMARY KEY ("portress_id")
);

-- CreateTable
CREATE TABLE "feedback" (
    "feedback_id" UUID NOT NULL,
    "feedback" TEXT NOT NULL,
    "user_id" UUID NOT NULL,

    CONSTRAINT "feedback_pkey" PRIMARY KEY ("feedback_id")
);

-- CreateTable
CREATE TABLE "payment" (
    "payment_id" UUID NOT NULL,
    "payment_date" TIMESTAMP(3) NOT NULL,
    "payment_methods" "Methods" NOT NULL,
    "portress_id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "res_id" UUID NOT NULL,

    CONSTRAINT "payment_pkey" PRIMARY KEY ("payment_id")
);

-- CreateTable
CREATE TABLE "Reservation" (
    "res_id" UUID NOT NULL,
    "total" INTEGER NOT NULL,
    "event_date" TIMESTAMP(3) NOT NULL,
    "location" TEXT NOT NULL,
    "res_date" TIMESTAMP(3) NOT NULL,
    "res_status" "Status",
    "user_id" UUID NOT NULL,
    "portressPortress_id" UUID,

    CONSTRAINT "Reservation_pkey" PRIMARY KEY ("res_id")
);

-- CreateTable
CREATE TABLE "chatSupport" (
    "chat_id" UUID NOT NULL,
    "QA" TEXT NOT NULL,
    "portress_id" UUID,
    "user_id" UUID,

    CONSTRAINT "chatSupport_pkey" PRIMARY KEY ("chat_id")
);

-- AddForeignKey
ALTER TABLE "feedback" ADD CONSTRAINT "feedback_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_portress_id_fkey" FOREIGN KEY ("portress_id") REFERENCES "Portress"("portress_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_res_id_fkey" FOREIGN KEY ("res_id") REFERENCES "Reservation"("res_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reservation" ADD CONSTRAINT "Reservation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reservation" ADD CONSTRAINT "Reservation_portressPortress_id_fkey" FOREIGN KEY ("portressPortress_id") REFERENCES "Portress"("portress_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chatSupport" ADD CONSTRAINT "chatSupport_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "chatSupport" ADD CONSTRAINT "chatSupport_portress_id_fkey" FOREIGN KEY ("portress_id") REFERENCES "Portress"("portress_id") ON DELETE SET NULL ON UPDATE CASCADE;
